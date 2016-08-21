class License < ApplicationRecord
	has_many :bridge_aim_container_and_licenses
	has_many :aim_license_containers, through: :bridge_aim_container_and_licenses

	has_many :bridge_like_container_and_licenses
	has_many :like_license_containers, through: :bridge_like_container_and_licenses

	has_many :test_schedules
	
	has_many :bridge_major_and_licenses
	has_many :majors, through: :bridge_major_and_licenses
end
