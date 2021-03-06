Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :users do
    resources :gifts
    get 'promised', on: :member
  end
  
  resources :gifts do
    collection do
      post :promise
      post :unpromise
    end
  end
  
  # resources :wishlistitems, :path => "MyWishListItems"
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
