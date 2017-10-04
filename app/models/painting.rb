class Painting < ApplicationRecord
  def access_params
      params.require(:painting).permit(:gallery_id, :name, :image)
    end
    
 belongs_to :gallery, optional: true
 mount_uploader :image, ImageUploader
end
