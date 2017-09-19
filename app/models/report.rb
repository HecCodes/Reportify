class Report < ApplicationRecord
  validates :test_quizes,:homework,:classwork,:punctuality_attendance,:contributions,:collab_coop, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11}, presence: true
  validates :openness_to_feedback,:takes_responsibility, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, presence: true
  validates :consistently_good_effort, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 14}, presence: true
  validates :teacher_id, :student_id, presence: true
  validates :date, presence:true

  belongs_to :teacher, class_name: :User
  belongs_to :student

end
