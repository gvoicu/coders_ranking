class PagesController < ApplicationController
  def index
    #render "pages/index2"
    @github_data = GithubData.where(:github_username => "andrei").first
  end

  def index2
  end

  def sign_in
  end

  def new_action
  end
end
