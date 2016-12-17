Rp::Engine.routes.draw do
  resources :available_reports do
    member do
      get :generate
    end
  end
  resources :reports do
    member do
      get :download
    end
  end
  root :to => 'available_reports#index'
end
