class User < ActiveRecord::Base
	has_secure_password
  has_many :results
  has_many :surveys
  has_one :region
end
