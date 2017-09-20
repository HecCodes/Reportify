class ParentsController < ApplicationController
  include SessionsHelper

  def index
    secure_route
    @parents = Parent.where(teacher_id:current_user).order(:first_name)
    if @parents.nil?
      redirect_to '/parents/new'
    end
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(
      first_name:params[:parent][:first_name],
      last_name:params[:parent][:last_name],
      email: params[:parent][:email],
      teacher_id: current_user.id
    )
    if @parent.save
      redirect_to parents_path
    else
      @errors = @parent.errors
      render 'new'
    end
  end

  def show

  end

  def edit
    @parent = Parent.find_by(id:params[:id])
  end

  def update
    @parent= Parent.find_by(id:params[:id])
    if @parent.update(
                        first_name:params[:parent][:first_name],
                        last_name:params[:parent][:last_name],
                        email:params[:parent][:email]
                      )
      redirect_to '/parents'
    else
      render 'edit'
    end
  end

  def destroy
    Parent.find_by(id:params[:id]).destroy
    redirect_to '/parents'
  end
end
