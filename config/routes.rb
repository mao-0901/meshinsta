Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "posts#index"
	resources :posts, only: [:index, :show, :new, :create] do
		resources :likes, only: :create
	end

	resources :likes, only: :destroy
  

end
