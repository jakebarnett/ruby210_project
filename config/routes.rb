Rails.application.routes.draw do
  resources :projects do
    resources :attribs
    resources :components
  end
  
  
  root to:  'home#index'
end
