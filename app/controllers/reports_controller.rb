class ReportsController < ApplicationController
  include SessionsHelper
  def index
    @reports = Report.where(teacher_id:current_user).order(:date)
  end
end


# :test_quizes,
# :homework,
# :classwork,
# :punctuality_attendance,
# :contributions,
# :collab_coop,
# :openness_to_feedback,
# :consistently_good_effort,
# :takes_responsibility,
# :teacher_id,
# :student_id,
# :feedback

# :date
