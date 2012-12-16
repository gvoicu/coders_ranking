Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github , '911773c26c4a8175f5b1','3cc2986785ee6496f44318d2fd02e7bad8d8c4fc', :scope => "user,repo,gist"
	provider :stackexchange, "1012", "iFXxBv4kgATHmf73wg5JaA((", public_key: "1pmXB5fVo)PCqALc*A3sOA((", site: 'stackoverflow', :scope => "private_info" , :redirect_uri => "http://127.0.0.1:3000/posts"
    #provider :linkedin, "0zeh8pty9p9q", "1AeFbennWPARaFN3", client_options: {request_token_path: '/uas/oauth/requestToken?scope=r_emailaddress'}, fields: ['id', 'first-name', 'last-name', 'headline', 'industry', 'picture-url', 'public-profile-url', 'email-address', 'positions', 'skills', 'educations', 'volunteer', 'associations', 'specialties', 'skills']
    #provider :linkedin, "0zeh8pty9p9q", "1AeFbennWPARaFN3", client_options: {request_token_path: '/uas/oauth/requestToken?scope=r_fullprofile'}, fields: ['id', 'first-name', 'last-name', 'skills']
end
