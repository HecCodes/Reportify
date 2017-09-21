class StudentsController < ApplicationController
  include SessionsHelper
  before_action :secure_route
  def index
      @students = Student.where(teacher_id:current_user).order(:first_name)
    if @students.nil?
      redirect_to '/students/new'
    end
  end

  def new
    @parents = Parent.where(teacher_id:current_user).order(:first_name)
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
    @reports= Report.where(student_id:params[:id])
  end

  def edit
    @parents = Parent.where(teacher_id:current_user.id).order(:last_name)
    @student = Student.find_by(id:params[:id])
  end

  def update
    space = params[:parent].index(" ")
    first_name = params[:parent][0..space-1]
    last_name = params[:parent][space+1..-1]
    @student= Student.find_by(id:params[:id])
    if @student.update(
                        first_name:params[:student][:first_name],
                        last_name:params[:student][:last_name],
                        parent_id: Parent.find_by(first_name:first_name, last_name:last_name).id
                      )
      redirect_to '/students'
    else
      render 'edit'
    end
  end

  def destroy
    student = Student.find_by(id:params[:id]).destroy
    redirect_to '/students'
  end
end
