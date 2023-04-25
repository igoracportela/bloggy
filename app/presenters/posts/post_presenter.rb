# frozen_string_literal: true

module Posts
  class PostPresenter < BasePresenter
    delegate :title, :content, to: :@obj
    delegate :title, :user_email, to: :blog, prefix: true
    delegate :email, to: '@obj.user', prefix: :user

    def blog
      @blog ||= Blogs::BlogPresenter.new @obj.blog if @obj&.blog
    end

    def comments
      @comments ||= Comments::CommentPresenter.present @obj.comments if @obj&.comments
    end

    def comments_size
      @obj.comment_count
    end
  end
end
