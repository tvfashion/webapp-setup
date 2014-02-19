class Season < ActiveRecord::Base

  belongs_to :show
  has_many :episodes
  has_many :characters
  has_many :fashions
  
end
