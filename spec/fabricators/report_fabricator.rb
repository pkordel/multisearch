Fabricator(:report) do
  user
  title FFaker::HipsterIpsum.word
  after_build do |report|
    report.keyword_list.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'keywords.csv')),
      filename: 'keywords.csv',
      content_type: 'text/csv'
    )
  end
end
