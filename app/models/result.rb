class Result < ActiveRecord::Base
  belongs_to :user # the taker
  belongs_to :choice
  belongs_to :result


  def get_user(id)
    User.find_by_id(id).name
  end




end
