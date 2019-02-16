class PostsController < ApplicationController
    before_action :authenticate

    def new
    end

    def create
        post = Post.new(
            content: params[:content],
            user_id: current_user.id
        )
        post.save
        redirect_to posts_new_path
    end

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def show
        @post = Post.find(params[:id])
    end
    
    private
    
    def authenticate
        redirect_to new_user_registration_path unless user_signed_in?
    end 
    
end