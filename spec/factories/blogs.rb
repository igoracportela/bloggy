# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
FactoryBot.define do
  factory :blog do
    title { FFaker::Lorem.sentence}
    association :user
  end
end
