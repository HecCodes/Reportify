class Report < ApplicationRecord
  validates :test_quizes,:homework,:classwork,:punctuality_attendance,:contributions,:collab_coop, :number, :inclusion => 0..11, numericality:true, presence: true
  validates :openness_to_feedback,:takes_responsibility,:number, :inclusion => 0..10,numericality:true, presence: true
  validates :consistently_good_effort,:number, :inclusion => 0..14,numericality:true, presence: true
  validates :teacher_id, :student_id, presence: true
  validates :date_range, presence:true

  belongs_to :teacher, class_name: :User
  belongs_to :student

end
