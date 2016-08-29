class CreateBridgeGotContainerAndLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_got_container_and_licenses do |t|
      t.integer :got_license_container_id
      t.integer :license_id

      t.string :qualifyitem
      t.string :enrollnum
      t.string :grade
      t.date :enrolldate
      t.date :issuedate
      t.string :etc

      t.timestamps
    end
  end
end
