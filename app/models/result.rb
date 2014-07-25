class Result < ActiveRecord::Base
  belongs_to :user # the taker
  belongs_to :choice
end
