require 'rails_helper'

RSpec.describe User, type: :model do
  example 'ユーザーネーム、メールアドレス、パスワードがあれば有効' do
    user = User.new(
      name:'test',
      email:'test@example.com',
      password:'password'
    )
    expect(user).to be_valid
  end
  example 'ユーザーネームがないと無効' do
    user = User.new(name:nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  example 'メールアドレスがないと無効' do
    user = User.new(email:nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  example 'パスワードがないと無効' do
    user = User.new(password:nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  example '重複したメールアドレスは無効' do
    User.create(
      name:'test boy',
      email:'testboy@example.com',
      password:'password'
    )
    user = User.new(
      name:'test girl',
      email:'testboy@example.com',
      password:'password'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
