class Wish < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: :user_id}

    validates :description_link1, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
    validates :description_link2, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
    validates :description_link3, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true


    belongs_to :user

end
