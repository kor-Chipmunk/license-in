class License < ApplicationRecord
    belongs_to :aim_license_container
	belongs_to :like_license_container

	has_many :test_schedules
	
	has_many :bridge_major_and_licenses
	has_many :majors, through: :bridge_major_and_licenses
	
	def self.search(search)
		where("name LIKE ?", "%#{search}%")
	end
end
