require 'rails_helper'

RSpec.describe SearchResult::Create, :vcr do
  it 'successfully creates search results' do
    report = Fabricate(:report)
    described_class.call(report: report)
    expect(report.search_results.count).to eq 2
  end
end
