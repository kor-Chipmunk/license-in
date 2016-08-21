class GotLicense < ApplicationRecord
    has_many :bridge_got_container_and_licenses
	has_many :got_license_containers, through: :bridge_aim_container_and_licenses
end