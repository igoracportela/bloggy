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
require "rails_helper"

RSpec.describe Post do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(4).is_at_most(255) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:blog_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:blog) }
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:comments) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:content).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:blog_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:comments_count).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index(:blog_id) }
    it { is_expected.to have_db_index(:user_id) }
  end
end
