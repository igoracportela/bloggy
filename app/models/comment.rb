# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#  post_id    :integer
#  user_id    :integer
#
class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :blog
  belongs_to :post

end
