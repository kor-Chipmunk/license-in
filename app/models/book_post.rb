class BookPost < ApplicationRecord
	mount_uploader :avatar, ImageUploader
	has_many :book_comments
	belongs_to :user
end
