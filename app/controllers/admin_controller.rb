class AdminController < ApplicationController
  before_action :ensure_admin

  def users
    @users = User.all
    render json: @users, status: :ok
  end

  def update_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def ensure_admin
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user.admin?
  end

  def user_params
    params.permit(:email, :password, :password_confirmation, :admin)
  end
end
