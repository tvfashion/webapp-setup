class Show < ActiveRecord::Base

  has_many :seasons
  has_many :episodes
  has_many :characters
  has_many :fashions
  
end
