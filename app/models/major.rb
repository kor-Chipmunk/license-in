class Major < ApplicationRecord
    belongs_to :user
	has_many :licenses, through: :bridge_major_and_license
end
