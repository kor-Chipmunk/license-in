class CreateBridgeMajorAndLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_major_and_licenses do |t|
      t.integer :license_id
      t.integer :major_id

      t.timestamps
    end
  end
end
