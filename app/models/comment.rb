class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text, :user_id

  belongs_to :user
  belongs_to :post
end
