require 'rails_helper'

RSpec.describe 'Wishes', type: :request do
  context '認証済みのユーザー' do
    it 'wish#new' do
      user = User.create(
        name: 'test',
        email: 'testtest@example.com',
        password: 'password'
      )
      sign_in user
      get new_wish_path
      expect(response).to have_http_status(200)
    end
  end
  context '認証未済のユーザー' do
    it 'wish#new' do
      get new_wish_path
      expect(response).to have_http_status(302)
    end
  end
end
