Rails.application.routes.draw do
  resources :customers
  root 'customers#new'

  # match '*path' => 'customers#new', via: :get
end
