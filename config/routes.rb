Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/offers/id/like', to: 'offers#like', as: 'like'
  patch '/offers/id/dislike', to: 'offers#dislike', as: 'dislike'

  resources :offers
end
