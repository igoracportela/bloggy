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
FactoryBot.define do
  factory :comment do
    content { FFaker::Lorem.paragraph }
    association :post
    association :blog
    association :user
  end
end
