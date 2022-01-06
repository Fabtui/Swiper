Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/offers/id/like', to: 'offers#like', as: 'like'
  get '/offers/id/like', to: 'offers#like', as: 'getlike'
  patch '/offers/id/like', to: 'offers#like', as: 'liked'

  resources :offers do
    resources :matches
  end
end
