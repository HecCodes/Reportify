class StudentsController < ApplicationController
  include SessionsHelper

  def index
    secure_route
    @students = Student.all
  end

  def new
    @parents = Parent.all
    @student = Student.new
  end

  def create
    space = params[:parent].index(" ")
    first_name = params[:parent][0..space-1]
    last_name = params[:parent][space+1..-1]

    @student = Student.new(
      first_name:params[:student][:first_name],
      last_name:params[:student][:last_name],
      teacher_id: current_user.id,
      parent_id: Parent.find_by(first_name:first_name, last_name:last_name).id
    )
    if @student.save
      redirect_to students_path
    else
      @errors = @student.errors
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
