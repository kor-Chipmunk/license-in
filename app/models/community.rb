class Community < ApplicationRecord
    has_many :community_comments
	belongs_to :user
    is_impressionable #:counter_cache => true
end
