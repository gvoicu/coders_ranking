class UsersController < ApplicationController
	def github
		omniauth=request.env["omniauth.auth"]
		raise omniauth.to_s

		#@user=omniauth[:info][:email]
	end
end
