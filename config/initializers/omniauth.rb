Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github , 'dc45e7db1fe39466604e','a967a42519426b6b118ca2bf27d2f33e6fddb57a', :scope => "user,repo,gist"
	provider :stackexchange, "1012", "iFXxBv4kgATHmf73wg5JaA((", public_key: "1pmXB5fVo)PCqALc*A3sOA((", site: 'stackoverflow', :scope => "private_info" , :redirect_uri => "http://127.0.0.1:3000/posts"
    #provider :linkedin, "0zeh8pty9p9q", "1AeFbennWPARaFN3", client_options: {request_token_path: '/uas/oauth/requestToken?scope=r_emailaddress'}, fields: ['id', 'first-name', 'last-name', 'headline', 'industry', 'picture-url', 'public-profile-url', 'email-address', 'positions', 'skills', 'educations', 'volunteer', 'associations', 'specialties', 'skills']
    #provider :linkedin, "0zeh8pty9p9q", "1AeFbennWPARaFN3", client_options: {request_token_path: '/uas/oauth/requestToken?scope=r_fullprofile'}, fields: ['id', 'first-name', 'last-name', 'skills']
end
