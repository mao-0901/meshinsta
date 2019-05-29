require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe '#index' do
		it "responds successfully" do
			get :index
			expect(response).to be_success
		end
	end

	before do
		user = FactoryBot.create(:user)
		@post = FactoryBot.create(:post, user: user)
	end
	
	describe '#show' do
		it "responds successfully" do
			get :show, params: {id: @post.id}
			expect(response).to be_success
		end
	end

	describe "#create" do
		# 認証済みのユーザーとして
		context "as an authenticated user" do
			before do
					@user = FactoryBot.create(:user)
					@post_params = FactoryBot.attributes_for(:post)
			end
			# postを追加できること
			it "adds a post" do
				sign_in @user
				expect{
					post :create, params: (@post_params)
				}.to change(@user.posts, :count).by(1)
			end

			# redirectすること
			it "redirect to show" do
				sign_in @user
				post :create, params: (@post_params)
				expect(response).to redirect_to(post_path(@user.posts.first))
			end

			# contentが空の場合
			it "content nil" do
				sign_in @user
				post :create, params: { content: nil }
				# debugger
				expect(assigns(:post).errors[:content]).to include("can't be blank")
			end
		end
		# ゲストとして

	
	end
end

#rootにidがあるやつは必ずパラメーターがいる
#postをcreateする時にフォームの値がパラメーターになる
#beforeはitごとに実行される
#rspecのパラメーターはハッシュ
#attribute_for, もしくは自分で作る