class PostsController < ApplicationController
    before_action :authenticate

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(
            content: params[:content],
            user: current_user
        )
        if  @post.save
            redirect_to("/posts/#{@post.id}")
        else
            render(:new)
        end
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