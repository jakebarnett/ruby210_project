Rails.application.routes.draw do
  resources :projects do
    resources :attribs
    resources :components
  end
  
  resources :capabilities
  
  root to:  'home#index'
end
