class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :load_user, only: [:show, :edit, :update]

  def dashboard
    @projects = current_user.projects.page(params[:page]).per(10)
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
