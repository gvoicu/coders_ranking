class PostsController < ApplicationController

    # current_user
    # user_signed_in?
    before_filter :authenticate_user!

    def index
        omniauth = request.env["omniauth.auth"]
        if omniauth.present?
						begin
							skills = omniauth.extra["raw_info"].skills.values[1].map do |skill|
									skill.skill.name
							end

							current_user.update_attributes(:skills => skills.join(","))
						rescue => e
							puts "Don't have any skills"
						end
        end

        obj = ActiveSupport::JSON.decode(omniauth.inspect.to_json)

        user = User.find_by_id(params[:user_id]) || current_user
        @posts = Post.where(:user_id => user.id)
        @User = current_user.id
				@user = user
				@most_prolific_language = user.most_used_tags[0][0]

				repo_count = user.repos_count
				@repo_badge = user.repos_count > 3 ? true : false	
    end

    def create
        params[:post][:user_id] = current_user.id
        puts(current_user.id)
        Post.create(params[:post])

        redirect_to "/posts"
    end
end
