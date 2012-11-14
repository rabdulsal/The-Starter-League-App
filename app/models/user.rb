class User < ActiveRecord::Base
  attr_accessible :avatar, :name, :email, :password, :password_confirmation

  has_many :pictures
  has_many :votes
  has_many :comments
  has_secure_password
  
end
