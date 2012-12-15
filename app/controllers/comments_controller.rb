class CommentsController < ApplicationController

    before_filter :authenticate_user!

    def index
    end

    def create
        params[:comment][:user_id] = current_user.id
        Comment.create(params[:comment])

        redirect_to "/posts"
    end
end
