# frozen_string_literal: true

module Blogs
  class BlogPresenter < BasePresenter
    delegate :title, to: :@obj
    delegate :email, to: '@obj.user', prefix: :user

    def posts
      @posts ||= Posts::PostPresenter.present(@obj.posts) if @obj&.posts
    end
  end
end
