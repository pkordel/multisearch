require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  describe 'GET /' do
    it 'is successful' do
      user = Fabricate(:user)
      sign_in user
      get '/'
      expect(response).to_not redirect_to(new_user_session_path)
    end
  end
end
