class Show < ActiveRecord::Base

  # associations
  has_many :seasons
  has_many :episodes
  has_many :characters
  has_many :fashions

  validates :name, presence: true, length: { minimum: 2 }
  
end
