class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :load_user, only: [:show, :edit, :update]

  def dashboard
    @projects = current_user.projects.order(created_at: :desc).page(params[:page]).per(10)
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

  def show
    @projects = @user.projects.page(params[:page]).per(10)
  end

  private

    def load_user
      @user = User.find(params[:id])
      redirect_to(root_path, error: 'User Not Found') unless @user
    end

    def update_params
      params.require(:user)
            .permit(:email, :name, :avatar, :description)
    end
end
