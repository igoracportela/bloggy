# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  comments_count :integer          default(0), not null
#  content        :text             not null
#  published_at   :datetime
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  blog_id        :integer          not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_posts_on_blog_id  (blog_id)
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord

  # Validations
  validates :title, presence: true, length: { in: 4..255 }
  validates :content, presence: true
  validates :blog_id, presence: true
  validates :user_id, presence: true

  # Relationships
  belongs_to :user
  belongs_to :blog

  has_many :comments, dependent: :destroy

  # Scopes
  scope :by_blog, lambda { |id, blog_id| includes(:blog, comments: :user).joins(:blog).find_by(id: id, blogs: {id: blog_id}) }
end
