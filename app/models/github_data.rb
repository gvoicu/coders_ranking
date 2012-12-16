class GithubData < ActiveRecord::Base
  attr_accessible :github_username, :user_id, :follow_nr, :uid
	belongs_to :user
	has_many :repos, :foreign_key => "user_id", :class_name => "Repo"
end
