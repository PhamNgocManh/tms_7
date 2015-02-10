class Admin::UsersController < Admin::AdminController
  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.require_password = false
    if @user.update_attributes user_params
      @user.require_password = true
      redirect_to [:admin, @user]
    else
      @user.require_password = true
      render "edit"
    end
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
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit :name,
      :email, :password, :password_confirmation, :admin
  end
end