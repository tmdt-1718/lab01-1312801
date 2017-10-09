class Gallery < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  has_many :paintings,dependent: :destroy
  belongs_to :user
  validates :user_id, presence: true
  has_many :impressionists
  mount_uploader :image, ImageUploader
end
