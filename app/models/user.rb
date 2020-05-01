class User < ApplicationRecord
    has_secure_password

    has_many :wishes
    has_one_attached :image

    mount_uploader :image,ImageUploader
end
