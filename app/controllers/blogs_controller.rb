class BlogsController < ApplicationController

  def show
    blog  = Blog.by_id(params[:id])
    @blog = Blogs::BlogPresenter.new(blog)
  end

end
