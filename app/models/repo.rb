class Repo < ActiveRecord::Base
  attr_accessible :id,:uid, :repos, :stars, :tag
	belongs_to :github_data
end
