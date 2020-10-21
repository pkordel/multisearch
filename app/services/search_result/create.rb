class SearchResult < ApplicationRecord
  class Create
    attr_reader :report, :endpoint, :search_limit

    def self.call(*args)
      new(*args).call
    end

    def initialize(report:)
      @report = report
      @search_limit = ENV.fetch('SEARCH_LIMIT').to_i
    end

    def call
      terms.each do |term|
        sleep 1 unless Rails.env.test?
        results = fetch_results(term)
        search_result = report.search_results.build(results)
        search_result.save
      end
    end

    private

    def terms
      csv_list = report.keyword_list.download
      counter = 0

      CSV.parse(csv_list, headers: :first_row).each_with_object([]) do |row, list|
        counter += 1
        break if counter == search_limit

        list << row.fetch('keyword')
      end
    end

    def results_page_for(endpoint, term)
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      driver = Selenium::WebDriver.for :chrome, options: options
      driver.get("#{endpoint}#{CGI.escape(term)}")
      driver.page_source
    end

    def fetch_results(term)
      endpoint = 'https://www.google.com/search?hl=en&q='
      body = results_page_for(endpoint, term)
      doc = Nokogiri::HTML(body)
      stats = search_stats(doc)
      {
        term: term,
        html: body,
        count_adwords_advertisers: doc.xpath('//div[@aria-label="Ads"]/div').size,
        count_links: doc.xpath('//a').size,
        count_hits: stats.dig(:hits),
        elapsed_time: stats.dig(:time)
      }
    end

    def search_stats(doc)
      result_stats = doc.xpath('//div[@id="result-stats"]')&.text
      matches = result_stats.match(/([\d+,\d+]+) \w+ \((\d+\.\d{2})/)
      return OpenStruct.new(hits: 0, time: 0) if matches.blank?

      OpenStruct.new(hits: matches[1], time: matches[2])
    end
  end
end
