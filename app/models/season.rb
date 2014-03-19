class Season < ActiveRecord::Base

  # associations
  belongs_to :show
  has_many :episodes
  has_many :actors
  has_many :fashions

  # example validation
  validates :name, presence: true, length: { minimum: 2 }
  
end
