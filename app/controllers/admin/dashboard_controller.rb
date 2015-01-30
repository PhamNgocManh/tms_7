class Admin::DashboardController < ApplicationController
  before_action :admin_user, only: :show
  def show
  end

  private

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
