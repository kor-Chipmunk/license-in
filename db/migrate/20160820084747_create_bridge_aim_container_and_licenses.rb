class CreateBridgeAimContainerAndLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_aim_container_and_licenses do |t|
      t.integer :aim_license_container_id
      t.integer :license_id

      t.timestamps
    end
  end
end
