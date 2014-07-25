class User < ActiveRecord::Base
  has_many :results
  has_many :surveys
  has_one :region
  has_secure_password
end
