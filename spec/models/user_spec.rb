require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    expect(Fabricate.build(:user)).to be_valid
  end

  it 'is not valid' do
    record = described_class.new
    expect(record).to be_invalid
    expect(record.errors.keys).to include(:email, :password)
  end
end
