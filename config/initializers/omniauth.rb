puts "++++++++++++++++++++++++++++++++++++++++++++++++"
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github , '911773c26c4a8175f5b1','3cc2986785ee6496f44318d2fd02e7bad8d8c4fc', :scope => "user,repo,gist"
	end
	
