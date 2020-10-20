require 'rails_helper'

RSpec.describe 'I want to generate a new search report', type: :feature do
  let(:user) { Fabricate(:user) }
  before do
    sign_in user
  end

  it 'I can view my reports' do
    Fabricate(:report, title: 'Wine coolers', user: user)
    visit reports_path
    expect(page).to have_content 'Wine coolers'
  end
end
