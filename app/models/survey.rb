class Survey < ActiveRecord::Base
  has_many :questions
  has_one :access_level
  belongs_to :user # the creator

  def get_user
	  if self.user_id == nil || self.user_id == 0
	  	return 'Anonymous'
	  else
	  	User.find(user_id).name
	  end
  end
end
