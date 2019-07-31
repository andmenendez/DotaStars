Rails.application.routes.draw do
	root to: 'events#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events
  resources :matches
  
  resources :teams do
    collection do
      get :create_standin
      get :update_roster
    end
  end

  resources :players
end
