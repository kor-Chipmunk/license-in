class CreateGotLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :got_licenses do |t|
      t.string :qualifyitem
      t.string :enrollnum
      t.string :grade
      t.date :enrolldate
      t.date :issuedate
      t.string :etc
      t.integer :got_license_container_id
      t.timestamps
    end
  end
end
