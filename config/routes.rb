Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :breeds do
    resources :puppies
    resources :parents
  end
  resources :breeders do
    resources :visitations
    resources :parents
    resources :litters, except: [:show, :destroy] do
      resources :puppies, except: [:show, :destroy]
      get 'my_requests', to: 'pages#my_requests', as: 'my_requests'
      get 'my_brand', to: 'pages#my_brand', as: 'my_brand'
    end
  end
  resources :litters, only: [:show, :destroy]
  resources :puppies, only: [:show, :destroy]
end
