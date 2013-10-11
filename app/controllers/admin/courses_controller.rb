class Admin::CoursesController < ApplicationController
  before_action :authenticate_user

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    course = Course.create(course_params)

    if course.save
      redirect_to admin_courses_path
      flash[:notice] = "The course was created."
    else
      redirect_to new_admin_course_path
      flash[:alert] = "The course was not created. Please try again."
    end
  end

  def active
    @courses = Course.where(status: "active").order("start_date")
    render :index
  end

  def pending
    @courses = Course.where(status: "pending").order("start_date")
    render :index
  end

  def archived
    @courses = Course.where(status: "archived").order("start_date")
    render :index
  end

  def activate
    course = Course.find_by(id: params[:id])
    course.activate

    redirect_to active_admin_courses_path
    flash[:notice] = "The course was activated."
  end

  def archive
    course = Course.find_by(id: params[:id])
    course.archive

    redirect_to archived_admin_courses_path
    flash[:notice] = "The course was archived."
  end

  private

  def course_params
    params.require(:course).permit(
      :title,
      :description,
      :tickets_url,
      :price,
      :start_date,
      :end_date
      )
  end
end