class Repo < ActiveRecord::Base
  attr_accessible :id,:uid, :repos, :stars, :tag
	belongs_to :github_data, :foreign_key => "uid", :class_name => "GithubData"

	validates_presence_of :repos, :uniqueness => true
end
