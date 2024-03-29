# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer          not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord

  # Validations
  validates :content, presence: true
  validates :blog_id, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true

  # Relationships
  belongs_to :blog
  belongs_to :post
  belongs_to :user

  counter_culture :post, column_name: :comments_count
end
