class Post < ApplicationRecord
    belongs_to :user
    has_many :likes
    validates :content, {presence: true}
    mount_uploader :image, ImagesUploader
end

