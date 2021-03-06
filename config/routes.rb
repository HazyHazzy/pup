Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :breeds do
    resources :puppies, except: [:new, :create]
    resources :parents
  end
  resources :breeders do
    resources :visitations, except: [:destroy]
    resources :parents
    resources :litters, except: [:show, :destroy, :edit, :update] do
      resources :puppies, except: [:show, :destroy, :edit, :update]
    end
  end
  resources :visitations, only: [:destroy]
  get 'my_requests', to: 'pages#my_requests', as: 'my_requests'
  get 'my_brand', to: 'pages#my_brand', as: 'my_brand'
  resources :litters, only: [:show, :destroy, :edit, :update]
  resources :puppies, only: [:show, :destroy, :edit, :update]
  get 'about_us', to: 'pages#about_us', as: 'about_us'
end
