class PostsController < ApplicationController

  def show
    ## show our blog post with the comments
    @blog = Blog.find(params[:blog_id])
    @post = Blog.find(params[:blog_id]).posts.find( params[:id] )
    @comments = Blog.find(params[:blog_id]).posts.find( params[:id] ).comments
  end

end
