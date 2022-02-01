# frozen_string_literal: true

module Comments
  class CommentPresenter < BasePresenter
    delegate :content, to: :@obj
    delegate :email, to: '@obj.user', prefix: :user
  end
end
