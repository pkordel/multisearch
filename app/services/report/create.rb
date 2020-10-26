class Report < ApplicationRecord
  class Create
    attr_reader :report

    def self.call(*args)
      new(*args).call
    end

    def initialize(report_params)
      @report = Report.new(report_params)
    end

    def call
      process_keywords if report.save
      report
    end

    private

    def process_keywords
      # SearchResult::Create.call(report: report)
      SearchResult::Create.perform_later(report: report)
    end
  end
end
