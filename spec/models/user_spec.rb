require 'rails_helper'

describe User, type: :model do
	describe 'has_many :posts' do
		let(:user) { FactoryBot.create(:user) }
		let(:post) { FactoryBot.create(:post, user: user) }
		it { expect(user.posts).to eq [post] }
	end

	describe 'has_many :likes' do
		let(:user) { FactoryBot.create(:user) }
		let(:post) { FactoryBot.create(:post, user: user) }
		let(:like) { FactoryBot.create(:like, post: post, user: user) }
		it { expect(user.likes).to eq [like]}
	end
end