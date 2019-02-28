class LikesController < ApplicationController
    def create
			@like = Like.new(user_id: current_user.id, post_id: params[:id])
			@like.save
			redirect_to("/posts/#{params[:id]}")
    end
end