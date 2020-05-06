require 'rails_helper'

RSpec.describe User, type: :model do
  example 'ユーザーネーム、メールアドレス、パスワードがあれば有効' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  example 'ユーザーネームがないと無効' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  example 'メールアドレスがないと無効' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  example 'パスワードがないと無効' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  example '重複したメールアドレスは無効' do
    FactoryBot.create(:user, email: 'testboy@example.com')
    user = FactoryBot.build(:user, email: 'testboy@example.com')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
end
