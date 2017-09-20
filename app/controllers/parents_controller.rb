class ParentsController < ApplicationController
  include SessionsHelper

  def index
    secure_route
    @parents = Parent.all.order(:first_name)
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
      email: params[:parent][:email]
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
    # @parents = Parent.all
    # @Parenta = Parenta.find_by(id:params[:id])
  end

  def update
    # space = params[:parent].index(" ")
    # first_name = params[:parent][0..space-1]
    # last_name = params[:parent][space+1..-1]
    # @Parenta= Parenta.find_by(id:params[:id])
    # if @Parenta.update(
    #                     first_name:params[:Parenta][:first_name],
    #                     last_name:params[:Parenta][:last_name],
    #                     parent_id: Parent.find_by(first_name:first_name, last_name:last_name).id
    #                   )
    #   redirect_to '/parents'
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # Parenta = Parenta.find_by(id:params[:id]).destroy
    # redirect_to '/parents'
  end
end
