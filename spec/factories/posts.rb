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
FactoryBot.define do
  factory :post do
    title { FFaker::Lorem.sentence }
    content { FFaker::Lorem.paragraph }
    association :blog
    association :user
  end
end
