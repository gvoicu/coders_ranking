class Repo < ActiveRecord::Base
  attr_accessible :id, :repos, :stars, :tag
	belongs_to :github_data
end
