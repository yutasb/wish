require 'rails_helper'

RSpec.describe Wish, type: :model do # rubocop:disable Metrics/BlockLength
  before do
    @user = User.create(
      name: 'test',
      email: 'test@example.com',
      password: 'password'
    )

    @wish = @user.wishes.create(
      title: 'test wish'
    )
  end

  example 'FactoryBotのデータ確認' do
    wish = FactoryBot.create(:wish)
    puts "wishのユーザーは#{wish.user.inspect}"
  end

  example 'タイトルは必須' do
    wish = Wish.new(title: nil)
    wish.valid?
    expect(wish.errors[:title]).to include("can't be blank")
  end

  context '重複関連' do
    example 'ユーザー単位では重複したwish名は許可しないこと' do
      @user.wishes.create(
        title: 'test wish'
      )

      new_wish = @user.wishes.build(
        title: 'test wish'
      )

      new_wish.valid?
      expect(new_wish.errors[:title]).to include('has already been taken')
    end

    example '異なるユーザーが同じ名前のwishを使うことは許可すること' do
      @user.wishes.create(
        title: 'test wish'
      )

      other_user = User.create(
        name: 'testboy',
        email: 'testboy@example.com',
        password: 'password'
      )
      other_wish = other_user.wishes.build(
        title: 'test wish'
      )

      expect(other_wish).to be_valid
    end
  end

  context 'リンクの正規表現' do
    example '正しいリンクの形式でないと無効' do
      user = @user
      new_wish = user.wishes.create(
        title: 'test wish',
        description_link1: 'test'
      )
      expect(new_wish).not_to be_valid
    end
    example '正しいリンクの形式なら有効' do
      user = @user
      new_wish = user.wishes.create(
        title: 'url test wish',
        description_link1: 'https://test.com'
      )
      expect(new_wish).to be_valid
    end
    example '値がnilならバリデーションはスキップ' do
      user = @user
      new_wish = user.wishes.create(
        title: 'skip url test wish',
        description_link1: nil
      )
      expect(new_wish).to be_valid
    end
  end
end
