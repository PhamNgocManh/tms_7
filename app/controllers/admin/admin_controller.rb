class Admin::AdminController < ApplicationController
  before_action :admin_user, :logged_in_user

  private

  def admin_user
    redirect_to root_url if logged_in? && !current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url   
    end
  end
  
end
