class Survey < ActiveRecord::Base
  has_many :questions
  has_one :access_level
  has_one :user # the creator

  def get_user(id)
    User.find_by_id(id).name
  end
end
