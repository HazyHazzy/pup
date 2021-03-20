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

   get 'requests', to: 'pages#requests'
    end
  end
end
