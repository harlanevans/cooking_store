Rails.application.routes.draw do
  root "plates#index"
  
  resources :plates do
    resources :ingredients
  end
  
end
