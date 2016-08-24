class CreateBridgeGotContainerAndLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_got_container_and_licenses do |t|
      t.integer :got_license_container_id
      t.integer :got_license_id

      t.timestamps
    end
  end
end
