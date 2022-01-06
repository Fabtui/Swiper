Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :offers do
    resources :matches
  end

  # defaults format: :json do
  #   resources :offers do
  #     resources :matches
  #   end
  # end
end
