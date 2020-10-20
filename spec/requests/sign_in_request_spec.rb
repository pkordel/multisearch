require 'rails_helper'

RSpec.describe 'Sign in', type: :request do
  describe 'GET /' do
    context 'when signed in' do
      it 'is successful' do
        user = Fabricate(:user)
        sign_in user
        get '/'
        expect(response).to_not redirect_to(new_user_session_path)
      end
    end

    context 'when not signed in' do
      it 'is successful' do
        get '/'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
