class LikeLicenseContainer < ApplicationRecord
    has_many :bridge_like_container_and_licenses
	has_many :licenses, through: :bridge_like_container_and_licenses
	belongs_to :user
end
