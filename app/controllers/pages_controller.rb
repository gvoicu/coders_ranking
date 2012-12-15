class PagesController < ApplicationController
  def index
    #render "pages/index2"
    @github_data = GithubData.where(:github_username => "andrei").first
  end

  def index2
  end
end
