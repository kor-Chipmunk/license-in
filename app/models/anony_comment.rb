class AnonyComment < ApplicationRecord
    belongs_to :anony_post
	belongs_to :user
end
