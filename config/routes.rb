Rp::Engine.routes.draw do
  resources :reports
  root :to => 'reports#index'
end
