class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :wishes, dependent: :destroy
  # has_one_attached :image

  mount_uploader :image, ImageUploader

  has_many :favorites
  has_many :favorite_wishes, through: :favorites, source: :wish



   # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end


  # has_many :relationships
  # has_many :followings, through: :relationships, source: :follow
  # has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  # has_many :followers, through: :reverse_of_relationships, source: :user

  # def follow(other_user)
  #   unless self == other_user
  #     relationships.find_or_create_by(follow_id: other_user.id)
  #   end
  # end

  # def unfollow(other_user)
  #   relationship = relationships.find_by(follow_id: other_user.id)
  #   relationship&.destroy
  # end

  # def following?(other_user)
  #   followings.include?(other_user)
  # end
end
