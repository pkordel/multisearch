require 'rails_helper'

RSpec.describe SearchResult, type: :model do
  it 'is valid' do
    exceeding_four_bytes = 2_147_483_647 + 1
    record = Fabricate.build(:search_result, count_hits: exceeding_four_bytes)
    expect(record).to be_valid
    expect { record.save! }.not_to raise_error
  end

  it 'is invalid' do
    record = described_class.new
    expect(record).to be_invalid
    expect(record.errors.keys).to include(:report, :term)
  end
end
