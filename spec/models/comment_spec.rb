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
require "rails_helper"

RSpec.describe Comment do

  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:blog_id) }
    it { is_expected.to validate_presence_of(:post_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:blog) }
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:content).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:blog_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:post_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index(:blog_id) }
    it { is_expected.to have_db_index(:post_id) }
    it { is_expected.to have_db_index(:user_id) }
  end
end
