class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.page(params[:page])
  end

  def edit
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
    params.require(:user).permit([:email, :password, :member, :profile, :works])
  end
end
