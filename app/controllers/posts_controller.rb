class PostsController < ApplicationController

    # current_user
    # user_signed_in?
    before_filter :authenticate_user!

    def index
        #@posts = Post.all
        @posts = Post.where(:user_id => current_user.id)

    end

    def create
        params[:post][:user_id] = current_user.id
        Post.create(params[:post])
        @User = current_user.id
        redirect_to "/posts"
    end
end
