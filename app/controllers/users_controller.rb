class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if params.require(:user)[:password] == ""
      current_user.update_without_password(user_params)
    else
      current_user.update(user_params)
      sign_in(current_user, bypass: true)
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit([:email, :password, :member, :profile, :works])
  end
end
