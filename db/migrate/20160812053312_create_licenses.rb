class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :name
      t.boolean :isofficial
      t.string :implementagency
      t.string :description
		
	  t.integer :aim_license_container_id
	  t.integer :like_license_container_id

      t.timestamps
    end
  end
end
