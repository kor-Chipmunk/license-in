class CreateTestSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :test_schedules do |t|
      t.boolean :iswtest
      t.boolean :isptest
      t.integer :license_id

      t.timestamps
    end
  end
end
