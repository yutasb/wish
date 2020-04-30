class Wish < ApplicationRecord
    validates :title, presence: true

    belongs_to :user

    # def wish_have_user
    #     wish_have_user = Wish.user.name
    # end
end
