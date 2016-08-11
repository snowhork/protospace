class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    3.times { @prototype.images.build }
  end

  def create
    @prototype = Prototype.new(prototype_params)

    if prototype_params[:images_attributes] &&
       !prototype_params[:images_attributes]["0"]
      flash[:danger] = 'You have to upload main image if you want to upload some images'
      render action: 'new'
      return
    end
    if @prototype.save
      redirect_to root_path, success: 'Upload your prototype successfully'
    else
      render action: 'new'
    end
  end

  def show
  end

  private

  def prototype_params
    params.require(:prototype)
          .permit(:title,
                  :catch_copy,
                  :concept,
                  images_attributes: [:substance])
          .merge(user_id: current_user.id)
  end
end
