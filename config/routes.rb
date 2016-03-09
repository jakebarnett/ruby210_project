Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'landing', to: 'pages#landing', as: 'landing'
  
  resources :projects do
    resources :attribs
    resources :components
  end
  
  resources :capabilities
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  
  root to:  'home#index'
end
