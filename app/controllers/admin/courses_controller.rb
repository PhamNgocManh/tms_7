class Admin::CoursesController < Admin::AdminController
  def new
    @course = Course.new
  end

  def show
    @course = Course.find params[:id]
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Added new course."
      redirect_to [:admin, @course]
      return
    else
     render "new"
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:success] = "Updated course."
      redirect_to [:admin, @course]
    else
      render "edit"
    end
  end

  def index
    @courses = Course.paginate page: params[:page]
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Deleted course."
    redirect_to admin_courses_url
  end

  private 
  def course_params
    params.require(:course).permit(:name, 
      user_courses_attributes: [:user_id, :_destroy, :id],
      subject_courses_attributes: [:subject_id,:_destroy,:id])
  end
end
