class UsersController < ApplicationController

  before_action :move_to_root, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if user_params[:password].blank?
      current_user.update_without_password(user_params)
    else
      current_user.update(user_params)
      sign_in(current_user, bypass: true)
    end
    redirect_to root_path, success: 'Edit your profile successfully'
  end

  private

  def user_params
    params.require(:user).permit([:email, :password, :member, :profile, :works, :avatar])
  end

  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
