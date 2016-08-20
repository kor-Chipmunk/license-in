class AnonyPost < ApplicationRecord
    has_many :anony_comments
	belongs_to :user
end
