class Comment < ActiveRecord::Base
  attr_accessible :comment, :picture_id, :user_id

  belongs_to :picture
  belongs_to :user
end
