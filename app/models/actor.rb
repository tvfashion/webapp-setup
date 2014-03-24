class Actor < ActiveRecord::Base

  # associations
  belongs_to :show
  has_many :fashions

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
