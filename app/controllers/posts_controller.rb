class PostsController < ApplicationController
  def show
    post = Post.by_blog(params[:id], params[:blog_id])
    @post = Posts::PostPresenter.new(post)
  end
end
