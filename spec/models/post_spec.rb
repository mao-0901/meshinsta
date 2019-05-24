require 'rails_helper'

describe Post, type: :model do
	describe 'belongs_to :user' do
		let(:user) { FactoryBot.create(:user) }
		let(:post) { FactoryBot.create(:post, user: user) }
		it { expect(post.user).to eq user }
	end

	describe 'has_many :likes' do
		let(:user)  { FactoryBot.create(:user) }
		let(:post) { FactoryBot.create(:post, user: user) }
		let(:like) { FactoryBot.create(:like, post:post, user: user) }
		it { expect(post.likes).to eq [like] }
	end

	it 'validation: content' do
		user = FactoryBot.create(:user) 
		post = FactoryBot.build(:post, content: nil, user: user) 
		post.valid?
		expect(post.errors[:content]).to include("can't be blank")
	end
end


	# [1, 2, 3]
	# a = 1
	# [a]

	# 1 == a
	# [1] == [a]

	# p post.likes # [<Like ...>, <Like ...>]
	# like = Like.create(...)
	# post.likes = [like]
	

		
	#end
	#it do end == {}

	# 行動・行い
# 1. post = Post.create(...)
# 2. like = Like.create(:user, ...)

# # 結果
# 3. post.user == user # true
# expect(post.user).to eq user
