class Wish < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id }
# rubocop:disable Layout/LineLength
  validates :description_link1, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true
  validates :description_link2, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true
  validates :description_link3, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true
# rubocop:enable Layout/LineLength
  belongs_to :user
  has_many :favorites

  def done_wish(wish)
    Wish.find_by(id: wish.id, done_flg: true)
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
