require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  let!(:user) { Fabricate(:user) }

  describe 'Browse reports' do
    it 'is successful when no reports exist' do
      sign_in user
      get root_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('There are no reports to show.')
    end

    it 'is successful when reports exist' do
      report = Fabricate(:report, user: user)
      sign_in user
      get root_path
      expect(response.body).to include(report.title)
    end
  end

  describe 'Create a new report', :vcr do
    before { sign_in user }

    it 'is successful' do
      file = fixture_file_upload(
        Rails.root.join('spec', 'fixtures', 'keywords.csv'), 'text/csv'
      )
      get new_report_path
      expect(response).to have_http_status(:ok)

      post reports_path, params: {
        report: {
          title: 'TITLE',
          keyword_list: file
        }
      }
      expect(response).to redirect_to reports_path
      follow_redirect!

      expect(response.body).to include('Report was created successfully.')
    end

    it 'is unsuccessful' do
      post reports_path, params: { report: { title: nil, keyword_list: nil } }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Title can&#39;t be blank')
      expect(response.body).to include('Keyword list can&#39;t be blank')
    end
  end
end
