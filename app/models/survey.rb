class Survey < ActiveRecord::Base
  has_many :questions
  has_one :access_level
  has_one :user # the creator

  def get_user(id)
  	# arg is survey id 
  	# need to return a user name
  	user_id = Survey.find(id).user_id	    
	  if user_id == nil 
	  	return 'Anonymous'
	  else 
	  	User.find(user_id).name
	  end
  end
end
