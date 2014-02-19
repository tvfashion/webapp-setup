class Fashion < ActiveRecord::Base

  belongs_to :episode
  belongs_to :show
  belongs_to :season
  belongs_to :character

end
