class Survey < ActiveRecord::Base
  has_many :questions
  has_one :access_level
  has_one :user # the creator
end
