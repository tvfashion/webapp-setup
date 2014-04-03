class Show < ActiveRecord::Base

  # associations
  has_many :episodes
  has_many :actors
  has_many :outfits, through: :episodes
    has_many :banners

  validates :name, presence: true, length: { minimum: 2 }
  
end
