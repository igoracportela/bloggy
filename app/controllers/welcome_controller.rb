class WelcomeController < ApplicationController
  def index
    @blogs = Blog.by_all
  end
end
