class ReportsController < ApplicationController
  include SessionsHelper
  before_action :secure_route

  def index
    @reports = Report.where(teacher_id:current_user).order(:date)
  end

  def new
    @report = Report.new
  end

  def create

  end


  def show
    @report=Report.find_by(id:params[:id])
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
