class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    tag = ActsAsTaggableOn::Tag.find(params[:id])
    @prototypes = Prototype.tagged_with(tag.name).page(params[:page])
    render template: 'prototypes/index'
  end
end
