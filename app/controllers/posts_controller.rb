class PostsController < ApplicationController

    # current_user
    # user_signed_in?
    before_filter :authenticate_user!

    def index
        #@posts = Post.all
        user = User.find_by_id(params[:user_id]) || current_user
        @posts = Post.where(:user_id => user.id)
        @User = current_user.id

    end

    def create
        params[:post][:user_id] = current_user.id
        puts(current_user.id)
        Post.create(params[:post])

        redirect_to "/posts"
    end
end
