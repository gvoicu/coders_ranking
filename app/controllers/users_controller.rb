class UsersController < ApplicationController

	before_filter :authenticate_user!

	def github
		require 'net/http'
	  # current_user => User-ul curent

		omniauth=request.env["omniauth.auth"]
		id=omniauth.uid

	  gd = GithubData.find_by_uid(omniauth.uid)
		if gd.present?
			sign_in gd.user
			redirect_to "/users"
			return
		end

		nickname=omniauth.info.nickname
		puts nickname

	  uri=URI.parse('https://api.github.com/users/' + nickname +'/repos')
		http=Net::HTTP.new(uri.host,uri.port)
		http.use_ssl=true

		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		data=http.get(uri.request_uri)
		info=data.body

		info=JSON.parse(info)
		followers_url=info[0]["owner"]["followers_url"]
		followers_nr=Integer(get_no(followers_url))
		new_git={:github_username => nickname, :user_id => current_user.id , :follow_nr => followers_nr, :uid => id}
		GithubData.create(new_git)

		for i in 0..(info.size-1)
			language=info[i]["language"]
			forks=Integer(info[i]["forks_count"])
			repo_name=info[i]["name"]
			star_url=info[i]["stargazers_url"].to_s
			star_nr=Integer(get_no(star_url))	
			new_repo={:uid => id, :repos =>repo_name , :stars => forks+star_nr, :tag => language}
			Repo.create(new_repo) rescue nil
		end
		current_user.compute_github_mark
	
		redirect_to "/users"
	end

  def index
    @Users = User.all.sort_by{ |user| -user.compute_github_mark }
  end

	private 

	def get_no(url)
		uri=URI.parse(url)
		http=Net::HTTP.new(uri.host,uri.port)
		http.use_ssl=true
		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		data_star=http.get(uri.request_uri)
		info_star=data_star.body
		info_star=JSON.parse(info_star)
		return info_star.size
	end
end
