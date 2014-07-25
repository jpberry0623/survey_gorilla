class Question < ActiveRecord::Base
  has_one :question_type
  has_many :choices
  belongs_to :survey
end
