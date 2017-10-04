class Gallery < ApplicationRecord
  has_many :paintings
  belongs_to :user
end
