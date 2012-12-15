class PostsController < ApplicationController

    # current_user
    # user_signed_in?
    before_filter :authenticate_user!

    def index
        @posts = Post.all
       # @posts = Post.where(:user_id => current_user.id)

    end

    def new
    end

    def create
<<<<<<< HEAD
=======
        #raise params
>>>>>>> aa50194c22e3757220a5025d46528a6992d369cc
        params[:user_id] = current_user.id
        Post.create(params[:post])
        redirect_to "/posts"
    end
end
