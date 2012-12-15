class GithubData < ActiveRecord::Base
  attr_accessible :github_username, :user_id
	belongs_to :user
	has_many :repos
end
