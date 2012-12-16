class UsersController < ApplicationController
<<<<<<< HEAD
	require 'net/http'
=======

>>>>>>> edbe97c510392dde6ff3c9e9ec1dbdebbf125811
	def github
		omniauth=request.env["omniauth.auth"]
		id=omniauth.uid
		nickname=omniauth.info.nickname
	  uri=URI.parse('https://api.github.com/users/' + nickname +'/repos')
		http=Net::HTTP.new(uri.host,uri.port)
		http.use_ssl=true
		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		data=http.get(uri.request_uri)
		info=data.body
		info=JSON.parse(info)
		followers_url=info[0]["owner"]["followers_url"]
		followers_nr=Integer(get_no(followers_url))
		new_git={:github_username => nickname, :user_id => id , :follow_nr => followers_nr}
		GithubData.create(new_git)

		for i in 0..(info.size-1)
			language=info[i]["language"]
			forks=Integer(info[i]["forks_count"])
			repo_name=info[i]["name"]
			star_url=info[i]["stargazers_url"].to_s
			star_nr=Integer(get_no(star_url))	
			new_repo={:uid => id, :repos =>repo_name , :stars => forks+star_nr, :tag => language}
			Repo.create(new_repo)
		end
	end

	private 
	def get__no(url)
		uri=URI.parse(url)
		http=Net::HTTP.new(uri.host,uri.port)
		http.use_ssl=true
		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		data_star=http.get(uri.request_uri)
		info_star=data_star.body
		info_star=JSON.parse(info_star)
		return info_star.size
	end

	def stackexchange
		omniauth=request.env["omniauth.auth"]
		
		raise omniauth.to_s
	end
end
