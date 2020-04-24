# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  comment_count :integer
#  content       :text
#  published_at  :datetime
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  blog_id       :integer
#  user_id       :integer
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
