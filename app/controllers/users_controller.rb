class UsersController < ApplicationController

	def github
		omniauth=request.env["omniauth.auth"]
		puts omniauth.inspect
		id=omniauth.uid
		nickname=omniauth.info.nickname
		#puts id
		#puts nickname
		new_git={:github_username => nickname, :user_id => id}
		GithubData.create(new_git)
		repo_url=omniauth.plan.repos_url
	end

	def stackexchange
		omniauth=request.env["omniauth.auth"]
		
		raise omniauth.to_s
	end
end
