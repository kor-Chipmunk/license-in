class TestSchedule < ApplicationRecord
    belongs_to :license
	has_many :written_test_schedules
	has_many :practice_test_schedules
end
