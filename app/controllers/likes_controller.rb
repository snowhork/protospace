class LikesController < ApplicationController
  def create
    @like = Like.new
    binding.pry
  end
end
