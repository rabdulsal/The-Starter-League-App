class Picture < ActiveRecord::Base
  attr_accessible :favorite, :note, :url

  has_many :comments
  has_many :votes
end
