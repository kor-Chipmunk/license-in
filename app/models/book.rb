class Book < ApplicationRecord
    mount_uploader :pic, ImageUploader
    has_many :book_comments
	belongs_to :user
	is_impressionable
end
