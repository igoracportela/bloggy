# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Blog < ApplicationRecord

  belongs_to :user

  has_many :posts
  has_many :comments

end
