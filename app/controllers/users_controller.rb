class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update]

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.require_password = false
    if @user.update_attributes user_params
      @user.require_password = true
      redirect_to @user
    else
      @user.require_password = true
      render "edit"
    end
  end

  def index    
    @users = User.all.paginate page: params[:page]
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
