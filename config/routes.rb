Rp::Engine.routes.draw do
  resources :authorized_users
  resources :settings
  resources :available_reports do
    member do
      get :generate
      get :add_authorized_user
    end
  end
  resources :reports do
    member do
      get :download
      get :show_fault
      post :retry
    end
  end
  root :to => 'available_reports#index'
end
