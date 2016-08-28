class PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).page(params[:page]).order('likes_count DESC')
  end
end
