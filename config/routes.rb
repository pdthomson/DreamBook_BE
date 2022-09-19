Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
		namespace :v1 do
			resources :blogs, only: [:index, :show, :create, :update, :destroy] do
				resources :comments, only: [:index, :show, :create, :update, :destroy]
      end
			
      resources :comments, only: [:index, :show, :create, :update, :destroy]
			resources :movie_recommendations, only: [:index]
		end
	end
end
