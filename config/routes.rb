Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "pages#index"
	resources :posts, only: [:index, :show, :new, :create] do
		resources :likes, only: :create
	end

	resources :likes, only: :destroy
  

	# post "/posts/post_id/likes" => "likes#create"
end
