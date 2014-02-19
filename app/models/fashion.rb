class Fashion < ActiveRecord::Base

  # associations
  belongs_to :episode
  belongs_to :show
  belongs_to :season
  belongs_to :character

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
