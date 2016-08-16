class LikeLicenseContainer < ApplicationRecord
    has_many :licenses
	belongs_to :user
end
