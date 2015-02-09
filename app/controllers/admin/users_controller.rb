class Admin::UsersController < Admin::AdminController

  def new
    @user = User.new
  end

  def edit
  end

  def index
    @users = User.all.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = "Create user sucessfully"
      redirect_to new_admin_user_path
    else 
      flash[:danger] = "Create user failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

end
