class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update]
  def show
    @user = User.find params[:id]
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
