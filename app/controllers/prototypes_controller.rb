class PrototypesController < ApplicationController
  include UsersHelper
  include LikesHelper

  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :add_main_flag, only: [:create, :update]
  before_action :delete_empty_tag, only: [:create, :update]

  def index
    @prototypes = Prototype.includes(:user).page(params[:page]).newly
  end

  def new
    @prototype = Prototype.new
    Prototype.max_images_num.times { @prototype.images.build }
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, success: 'Upload your prototype successfully'
    else
      flash.now[:danger] = @prototype.errors.full_messages[0]
      render action: 'new'
    end
  end

  def show
    if user_signed_in? && user_likes_prototype?(current_user, @prototype)
      @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id])
    end
  end

  def edit
    (Prototype.max_images_num - @prototype.images.length).times { @prototype.images.build }
    @main_image = @prototype.images[0]
  end

  def update
    if is_instance_current_users?(@prototype) && @prototype.update(prototype_params)
      redirect_to root_path, success: 'Edit your prototype successfully'
    else
      flash.now[:danger] = @prototype.errors.full_messages[0]
      render action: 'edit'
    end
  end

  def destroy
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
                  tag_list: [],
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

  def delete_empty_tag
    params.require(:prototype)[:tag_list].delete_if { |v| v.empty? }
  end
end
