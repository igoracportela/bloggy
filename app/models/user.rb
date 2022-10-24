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
class User < ApplicationRecord
  include ActiveModel::Validations

  authenticates_with_sorcery!

  validates :email, presence: true, email: true, uniqueness: true

  has_many :blogs
  has_many :posts
  has_many :comments
end
