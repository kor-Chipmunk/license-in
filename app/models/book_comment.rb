class BookComment < ApplicationRecord
	belongs_to :book_post
	belongs_to :user
end
