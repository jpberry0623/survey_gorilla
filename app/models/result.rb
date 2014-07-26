class Result < ActiveRecord::Base
  belongs_to :user # the taker
  belongs_to :choice


  def get_user(id)
    User.find_by_id(id).name
  end




end
