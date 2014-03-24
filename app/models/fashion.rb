class Fashion < ActiveRecord::Base

  # associations
  belongs_to :episode
  belongs_to :actor

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
