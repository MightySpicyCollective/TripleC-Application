class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: [:edit, :update]

  def dashboard
    @projects = current_user.projects
  end

  def edit
  end

  def update
    if @user.update(update_params)
      redirect_to dashboard_path, notice: 'User Updated.'
    else
      render :edit
    end
  end

  private

    def load_user
      @user = User.where(id: params[:id]).first
      redirect_to(root_path, error: 'User Not Found') unless @user
    end

    def update_params
      params.require(:user)
            .permit(:email, :first_name, :last_name, :avatar)
    end
end
