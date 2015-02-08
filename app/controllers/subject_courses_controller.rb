class SubjectCoursesController < ApplicationController
  def new
  end

  def destroy
    SubjectCourse.find(params[:id]).destroy
    flash[:success] = "Deleted Subject."
    redirect_to courses_url
  end

end
