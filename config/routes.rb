Rails.application.routes.draw do
  resources :projects do
    resources :attribs
  end
  
  
  root to:  'home#index'
end
