class Actor < ActiveRecord::Base

  # associations
  belongs_to :show
  belongs_to :episode
  has_many :fashions

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
