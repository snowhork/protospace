class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    binding.pry
    current_user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit([:email, :password, :member, :profile, :works])
  end
end
