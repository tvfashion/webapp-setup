class Episode < ActiveRecord::Base

  # associations
  belongs_to :show
  has_many :outfits
  has_many :actors, through: :show

  # example validation
  validates :name, presence: true, length: { minimum: 2 }

end
