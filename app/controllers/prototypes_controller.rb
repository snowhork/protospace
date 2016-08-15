class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all.includes(:user).page(params[:page]).per(8)
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
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype)
          .permit(:title,
                  :catch_copy,
                  :concept,
                  images_attributes: [:substance, :main_flag])
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

end
