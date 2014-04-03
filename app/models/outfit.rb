class Outfit < ActiveRecord::Base
  belongs_to :episode
  belongs_to :actor
end
