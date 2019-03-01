class PostsController < ApplicationController
    before_action :authenticate

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(
            content: params[:content],
            user: current_user,
            image: params[:image]
        )
        if  @post.save
            redirect_to(post_path(@post))
        else
            render(:new)
        end
    end

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def show
				@post = Post.find(params[:id])
				# @like = Like.find_by(user: current_user, post: @post)
				@like = @post.likes.find_by(user: current_user)
    end
    
    private
    
    def authenticate
        redirect_to new_user_registration_path unless user_signed_in?
    end 
    
end