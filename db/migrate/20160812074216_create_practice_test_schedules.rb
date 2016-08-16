class CreatePracticeTestSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :practice_test_schedules do |t|
      t.date :appdatestart
      t.date :appdateend
      t.date :testdatestart
      t.date :testdateend
      t.date :testresultdate
      t.integer :test_schedule_id

      t.timestamps
    end
  end
end
