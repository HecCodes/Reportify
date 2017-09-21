class ReportsController < ApplicationController
  include SessionsHelper
  before_action :secure_route

  def index
    @reports = Report.where(teacher_id:current_user).order(:created_at)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(
                          test_quizes:params[:report][:test_quizes].to_i,
                          homework:params[:report][:homework].to_i,
                          classwork:params[:report][:classwork].to_i,
                          punctuality_attendance:params[:report][:punctuality_attendance].to_i,
                          contributions:params[:report][:contributions].to_i,
                          collab_coop:params[:report][:collab_coop].to_i,
                          openness_to_feedback:params[:report][:openness_to_feedback].to_i,
                          consistently_good_effort:params[:report][:consistently_good_effort].to_i,
                          takes_responsibility:params[:report][:takes_responsibility].to_i,
                          teacher_id:current_user.id,
                          student_id:params[:student_id].to_i,
                          feedback:params[:report][:feedback],
                          assignment:params[:report][:assignment]
                        )
    if @report.save
      redirect_to "/students/#{params[:student_id].to_i}"
    else
      @errors = @report.errors.full_messages
      render 'new'
    end
  end

  def edit
    @report = Report.find_by(id:params[:id])
  end

  def update
    @report = Report.find_by(id:params[:id])
    if @report.update(
                          test_quizes:params[:report][:test_quizes].to_i,
                          homework:params[:report][:homework].to_i,
                          classwork:params[:report][:classwork].to_i,
                          punctuality_attendance:params[:report][:punctuality_attendance].to_i,
                          contributions:params[:report][:contributions].to_i,
                          collab_coop:params[:report][:collab_coop].to_i,
                          openness_to_feedback:params[:report][:openness_to_feedback].to_i,
                          consistently_good_effort:params[:report][:consistently_good_effort].to_i,
                          takes_responsibility:params[:report][:takes_responsibility].to_i,
                          teacher_id:current_user.id,
                          student_id:Report.find_by(id:params[:id]).student.id,
                          feedback:params[:report][:feedback],
                          assignment:params[:report][:assignment]
                        )
      render 'show'
    else
      @errors = @report.errors.full_messages
      render 'edit'
    end
  end


  def show
    @report=Report.find_by(id:params[:id])
  end

  def destroy
    Report.find_by(id:params[:id]).destroy
    redirect_to '/reports'
  end

end