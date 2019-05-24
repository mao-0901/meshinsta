require 'rails_helper'

describe Like, type: :model do
	describe 'belongs_to user' do
		let(:user) { FactoryBot.create(:user) }
		let(:post) { FactoryBot.create(:post, user: user) }
		let(:like) { FactoryBot.create(:like, user: user, post: post) }
		it {expect(like.user).to eq user}
	end

	describe 'belongs_to post' do
		let(:user) { FactoryBot.create(:user) }
		let(:post) { FactoryBot.create(:post, user: user) }
		let(:like) { FactoryBot.create(:like, user: user, post: post) }
		it {expect(like.post).to eq post}
	end
end