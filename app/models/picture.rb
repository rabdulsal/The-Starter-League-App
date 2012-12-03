class Picture < ActiveRecord::Base
  attr_accessible :favorite, :note, :url

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
end
