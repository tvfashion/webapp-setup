class Outfit < ActiveRecord::Base
  belongs_to :episode
  belongs_to :actor
  attr_accessor :show
    mount_uploader :image, OutfitUploader
end
