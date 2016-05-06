class WelcomeController < ApplicationController
  before_action :redirect_on_current_user, only: :index

  def index
  end

  def contact
    @enquiry = Enquiry.new
  end

  def active_projects
    @projects = Project.active.page(params[:page]).per(10)
  end

  private

  def redirect_on_current_user
    redirect_to dashboard_path if current_user
  end
end
