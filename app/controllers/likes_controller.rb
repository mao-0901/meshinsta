class LikesController < ApplicationController
	before_action :authenticate
    def create
			like = Like.new(user_id: current_user.id, post_id: params[:post_id])
			like.save
			redirect_to(post_path(id: params[:post_id]))
		end
		
		def destroy
			like = Like.find(params[:id])
			post = like.post
			like.destroy
			redirect_to(post_path(post))
		end
end