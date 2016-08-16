class CreateAimLicenseContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :aim_license_containers do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
