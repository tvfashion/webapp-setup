class Fashion < ActiveRecord::Base

  # associations
  belongs_to :outfit

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
