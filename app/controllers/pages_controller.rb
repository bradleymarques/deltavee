class PagesController < ApplicationController
  before_action :check_signed_in_player
  before_action :check_signed_in_admin

  def home
  end

  def about
  end

  private

  def check_signed_in_player
    redirect_to(dashboard_path) if signed_in? && current_user.player?
  end

  def check_signed_in_admin
    redirect_to(admin_dashboard_path) if signed_in? && current_user.admin?
  end
end
