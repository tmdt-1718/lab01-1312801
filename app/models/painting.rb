class Painting < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  def access_params
      params.require(:painting).permit(:name, :image, :remote_image_url)
    end

 belongs_to :gallery, optional: true
 belongs_to :user
 validates :user_id, presence: true
 mount_uploader :image, ImageUploader
 has_many :impressionists
end
