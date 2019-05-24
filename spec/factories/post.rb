FactoryBot.define do
	factory :post do
		content { "hogehoge" }
		image { "image" }
		# association :user
		# association :like
  end
end