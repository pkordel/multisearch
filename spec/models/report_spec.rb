require 'rails_helper'

RSpec.describe Report, type: :model do
  let!(:user) { Fabricate(:user) }

  it 'is valid' do
    expect(Fabricate.build(:report)).to be_valid
  end

  it 'is invalid' do
    record = described_class.new
    expect(record).to be_invalid
    expect(record.errors.keys).to include(:user, :title)
  end
end
