class AimLicenseContainer < ApplicationRecord
	has_many :bridge_aim_container_and_licenses
	has_many :licenses, through: :bridge_aim_container_and_licenses

	belongs_to :user
end
