class License < ApplicationRecord
<<<<<<< HEAD
	belongs_to :aim_license_container
=======
    belongs_to :aim_license_container
>>>>>>> yeseul
	belongs_to :like_license_container

	has_many :test_schedules
	has_many :majors, through: :bridge_major_and_license
end
