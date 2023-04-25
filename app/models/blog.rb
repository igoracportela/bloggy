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
class Blog < ApplicationRecord
  delegate :email, to: :user, prefix: :user

  # Validations
  validates :title, presence: true, uniqueness: true, length: { in: 4..255 }
  validates :user_id, presence: true

  # Relationships 
  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Scopes
  scope :by_all, -> { includes(:user).where.not(user_id: nil).limit(50) }
  scope :by_id, ->(id) { includes(:posts).find_by(id: id) }
end
