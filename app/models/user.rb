class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true



    has_many :wishes, :dependent => :destroy
    # has_one_attached :image

    mount_uploader :image,ImageUploader
end
