class PostsController < ApplicationController

    # current_user
    # user_signed_in?
    before_filter :authenticate_user!

    def index
        omniauth = request.env["omniauth.auth"]
        obj = ActiveSupport::JSON.decode(omniauth.inspect.to_json)
        raise obj
        #@posts = Post.all
        @posts = Post.where(:user_id => current_user.id)
        @User = current_user.id

    end

    def create
        params[:post][:user_id] = current_user.id
        puts(current_user.id)
        Post.create(params[:post])

        redirect_to "/posts"
    end
end
