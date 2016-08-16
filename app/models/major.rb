class Major < ApplicationRecord
<<<<<<< HEAD
	belongs_to :user
=======
    belongs_to :user
>>>>>>> yeseul
	has_many :licenses, through: :bridge_major_and_license
end
