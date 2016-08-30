class PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).page(params[:page]).order('likes_count DESC')
    render template: 'prototypes/index'
  end
end
