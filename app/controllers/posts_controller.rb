class PostsController < ApplicationController

    # current_user
    # user_signed_in?
    before_filter :authenticate_user!

    def index
        omniauth = request.env["omniauth.auth"]
        if omniauth.present?
            skills = omniauth.extra["raw_info"].skills.values[1].map do |skill|
                skill.skill.name
            end

            current_user.update_attributes(:skills => skills.join(","))
        end

        @posts = Post.where(:user_id => current_user.id)
        user = User.find_by_id(params[:user_id]) || current_user
        @User = user
    end

    def create
        params[:post][:user_id] = current_user.id
        puts(current_user.id)
        Post.create(params[:post])

        redirect_to "/posts"
    end
end
