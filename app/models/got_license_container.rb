class GotLicenseContainer < ApplicationRecord
	has_many :licenses
	belongs_to :user
end
