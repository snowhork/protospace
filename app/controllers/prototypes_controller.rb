include UsersHelper

class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all.includes(:user).page(params[:page])
  end

  def new
    @prototype = Prototype.new
    3.times { @prototype.images.build }
  end

  def create
    add_main_flag
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, success: 'Upload your prototype successfully'
    else
      flash.now[:danger] = @prototype.errors.full_messages[0]
      render action: 'new'
    end
  end

  def show
  end

  def edit
    (3 - @prototype.images.length).times { @prototype.images.build }
    @main_image = @prototype.images[0]
  end

  def update
    add_main_flag
    if is_instance_current_users?(@prototype) && @prototype.update(prototype_params)
      redirect_to root_path, success: 'Edit your prototype successfully'
    else
      flash.now[:danger] = @prototype.errors.full_messages[0]
      render action: 'edit'
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if is_instance_current_users?(@prototype) && @prototype.destroy
      redirect_to root_path, success: 'Delete your prototype successfully'
    else
      redirect_to root_path
    end

  end

  private

  def prototype_params
    params.require(:prototype)
          .permit(:title,
                  :catch_copy,
                  :concept,
                  images_attributes: [:substance, :main_flag, :id])
          .merge(user_id: current_user.id)
  end

  def add_main_flag
    params.require(:prototype)[:images_attributes].each{ |key, value|
      if key == '0'
        value.merge!(main_flag: true)
      else
        value.merge!(main_flag: false)
      end
    } if params.require(:prototype)[:images_attributes].present?
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
