class Repo < ActiveRecord::Base
  attr_accessible :id, :repos, :stars, :tag
end
