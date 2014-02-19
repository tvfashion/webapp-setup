class Character < ActiveRecord::Base

  belongs_to :show
  belongs_to :episode
  has_many :fashions

end
