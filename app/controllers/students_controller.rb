class StudentsController < ApplicationController
  include SessionsHelper

  def index
    secure_route
    @students = Student.all
  end

  def new

  end

  def create

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
