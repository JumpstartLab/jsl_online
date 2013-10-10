class Admin::CourseController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @courses = Course.find_by(id: params[:id])
  end

  def active
    @courses = Course.where(status: "active")
    render :index
  end

  def pending
    @courses = Course.where(status: "pending")
    render :index
  end

  def archived
    @courses = Course.where(status: "archived")
    render :index
  end
end