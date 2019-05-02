Rails.application.routes.draw do
  resources :dragons
  resources :users
  get '/' => 'users#index', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
