class GotLicenseContainer < ApplicationRecord
    has_many :bridge_got_container_and_licenses
	has_many :licenses, through: :bridge_got_container_and_licenses
	belongs_to :user
end
