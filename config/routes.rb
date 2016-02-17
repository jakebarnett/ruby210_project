Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show] do
  end

  root to:  'home#index'
end
