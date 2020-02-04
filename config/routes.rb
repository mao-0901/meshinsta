Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "posts#index"
	resources :posts, only: [:index, :show, :new, :create, :destroy] do
		resources :likes, only: :create
	end

	resources :likes, only: :destroy
	resources :users, only: :show

<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
	namespace :api do
		namespace :v1 do
			resources :posts, only: :none do
				resources :likes, only: [:create]
			end
			namespace :gurunavi do
				get "/search", :action  => "search"
				get "/", :action => "new"
			end
		end
	end

<<<<<<< Updated upstream
	#to do likesのresourcesで書く
	delete "api/v1/posts/:post_id/likes" => "api/v1/likes#destroy"
=======
	resources :users do
		resources :relationships, only: [:create, :destroy]
		get :follows, on: :member 
		get :followers, on: :member 
	end
	#to do likesのresourcesで書く
	delete "api/v1/posts/:post_id/likes" => "api/v1/likes#destroy"
>>>>>>> Stashed changes
>>>>>>> Stashed changes
end
