class Api::V1::LikesController < ApplicationController
	def create
		p "===================="
		p current_user
		# like = Like.new(user_id: current_user.id, post_id: params[:post_id])
		# like.save
		# redirect_to(post_path(id: params[:post_id]))
		# end
	end
end