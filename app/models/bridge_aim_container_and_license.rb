class BridgeAimContainerAndLicense < ApplicationRecord
	belongs_to :aim_license_container
	belongs_to :license
end
