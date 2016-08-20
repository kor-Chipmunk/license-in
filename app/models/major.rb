class Major < ApplicationRecord
    has_many :users
    
    has_many :bridge_major_and_licenses
	has_many :licenses, through: :bridge_major_and_licenses
end