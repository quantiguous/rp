Rp::Engine.routes.draw do
  resources :available_reports
  resources :reports do
    member do
      get :download
    end
  end
  root :to => 'available_reports#index'
end
