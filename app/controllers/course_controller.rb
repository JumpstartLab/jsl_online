class CourseController < ApplicationController
  def show
    @course = Course.find_by(id: params[:id])
  end
end