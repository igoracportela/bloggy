class BlogsController < ApplicationController

  def show
    ## show our blog with the post
    @blog  = Blog.find(params[:id])
    @posts = Blog.find(params[:id]).posts
  end

end
