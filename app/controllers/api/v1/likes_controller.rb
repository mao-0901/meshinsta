class Api::V1::LikesController < ApplicationController
	def create
		like = Like.new(user_id: current_user.id, post_id: params[:post_id])
		p "!!!!!!!!!!!"
		like.save
		render :json => { success: true }
	end
	
	def destroy
		like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
		like.destroy
		p "!!!!!!!!"
		render :json => { success: true }
	end
end