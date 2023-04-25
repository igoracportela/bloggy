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
require "rails_helper"

RSpec.describe Blog do

  describe "validations" do
    before do
      create(:blog)
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(4).is_at_most(255) }
    it { is_expected.to validate_uniqueness_of(:title) }

    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end

  describe "delegators" do
    it { is_expected.to delegate_method(:email).to(:user).with_prefix(:user) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index(:user_id) }
  end
end
