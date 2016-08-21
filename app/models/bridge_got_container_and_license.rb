class BridgeGotContainerAndLicense < ApplicationRecord
	belongs_to :got_license_container
	belongs_to :license
end
