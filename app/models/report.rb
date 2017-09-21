class Report < ApplicationRecord
  validates :test_quizes,:homework,:classwork,:punctuality_attendance,:contributions,:collab_coop, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11}, presence: true
  validates :openness_to_feedback,:takes_responsibility, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, presence: true
  validates :consistently_good_effort, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 14}, presence: true
  validates :teacher_id, :student_id, presence: true
  validates :date, :assignment, presence:true

  belongs_to :teacher, class_name: :User
  belongs_to :student

  def self.performance_score(report_id)
    report = self.find_by(id:report_id)
    return report.test_quizes+report.homework + report.classwork
  end

  def self.participation_score(report_id)
    report = self.find_by(id:report_id)
    return report.punctuality_attendance + report.contributions + report.collab_coop
  end

  def self.commitment_score(report_id)
    report = self.find_by(id:report_id)
    return report.openness_to_feedback + report.consistently_good_effort + report.takes_responsibility
  end

  def self.total_score(report_id)
    Report.performance_score(report_id) + Report.participation_score(report_id) + Report.commitment_score(report_id)
  end

  def self.performance_total_score
    return 33
  end

  def self.participation_total_score
    return 33
  end

  def self.commitment_total_score
    return 34
  end

  def self.grade(report_id)
    one_hundred = Report.performance_total_score + Report.participation_total_score + Report.commitment_total_score
    percentage = self.total_score(report_id)/one_hundred
    return percentage * 100
  end
end
