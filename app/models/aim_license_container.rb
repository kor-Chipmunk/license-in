class AimLicenseContainer < ApplicationRecord
	has_many :licenses
	belongs_to :user
end
