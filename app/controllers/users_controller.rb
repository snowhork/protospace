class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    User.update(user_params)
  end

  private

  def user_params
    params[:email, :password, :member, :profile, :works]
  end
end
