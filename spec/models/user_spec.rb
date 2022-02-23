# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  crypted_password :string
#  email            :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require "rails_helper"

RSpec.describe User do

  describe "validations" do
    before do
      create(:user)
    end

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { is_expected.to have_many(:blogs) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:crypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }

    it { is_expected.to have_db_index(:email) }
  end
end
