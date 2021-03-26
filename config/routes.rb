Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :breeds
  resources :breeders do
    resources :visitations
    resources :parents
    resources :litters do
      resources :pups

#     resources :litters do
#       resources :pups
#       resources :parents
#     end
#   end
# end

  get 'my_requests', to: 'pages#my_requests', as: 'my_requests'
  get 'my_brand', to: 'pages#my_brand', as: 'my_brand'
    end
  end
end
