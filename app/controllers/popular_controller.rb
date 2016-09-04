class PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).page(params[:page]).popular
    render template: 'prototypes/index'
  end
end
