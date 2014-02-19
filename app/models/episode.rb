class Episode < ActiveRecord::Base

  # associations
  belongs_to :season
  belongs_to :show
  has_many :fashions
  has_many :characters

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
