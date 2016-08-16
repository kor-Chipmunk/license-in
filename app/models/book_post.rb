class BookPost < ApplicationRecord
<<<<<<< HEAD
	mount_uploader :avatar, ImageUploader
=======
    mount_uploader :avatar, ImageUploader
>>>>>>> yeseul
	has_many :book_comments
	belongs_to :user
end
