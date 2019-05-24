FactoryBot.define do
	factory :user do
		sequence(:email){|n| "test#{n}@example.com"}
		password { "password" }
		# association :post
		# association :like
  end
end