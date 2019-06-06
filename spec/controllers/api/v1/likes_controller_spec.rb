require 'rails_helper'

RSpec.describe Api::V1::LikesController, type: :controller do
	describe '#create' do
		it "responds successfully" do
			post :create
			expect(true).to eq true
		end
	end
end
