require 'rails_helper'

RSpec.describe SearchResult, type: :model do
  it 'is valid' do
    expect(Fabricate.build(:search_result)).to be_valid
  end

  it 'is invalid' do
    record = described_class.new
    expect(record).to be_invalid
    expect(record.errors.keys).to include(:report)
  end
end
