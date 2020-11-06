require 'rails_helper'

RSpec.describe Report::Create do
  let(:user) { Fabricate(:user) }

  it 'is successful' do
    record = described_class.call(
      user: user,
      title: 'TITLE',
      keyword_list: fixture_file_upload(
        Rails.root.join('spec', 'fixtures', 'keywords.csv'), 'text/csv'
      )
    )
    expect(record).to be_valid
  end
end
