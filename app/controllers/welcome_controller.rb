class WelcomeController < ApplicationController

  def index
    # we want to list all of the blogs
    @blogs = Blog.all
  end

end
