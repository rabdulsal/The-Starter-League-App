class Vote < ActiveRecord::Base
  attr_accessible :picture_id, :user_id, :vote

  belongs_to :user
  belongs_to :picture
end
