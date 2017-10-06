class Blog < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true
  has_many :comments
  has_many :impressionists
end
