class PostsController < ApplicationController
    before_action :authenticate, only: [:new, :create]

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
				binding.pry
    end

    def show
				@post = Post.find(params[:id])
				# @like = Like.find_by(user: current_user, post: @post)
				@like = @post.likes.find_by(user: current_user)
		end 
		
		def destroy
			@post = Post.find(params[:id]).destroy
			redirect_to user_path(current_user)
		end
end