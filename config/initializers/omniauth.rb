puts "++++++++++++++++++++++++++++++++++++++++++++++++"
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github , 'dc45e7db1fe39466604e','a967a42519426b6b118ca2bf27d2f33e6fddb57a', :scope => "user,repo,gist"
	end
	
