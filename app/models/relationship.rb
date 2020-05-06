class Relationship < ApplicationRecord
    has_and_belongs_to_many :user
    belongs_to :follow, class_name: "User"

    validates :user_id, presence: true
    validates :follow_id, presence: true
end
