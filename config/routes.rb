Rails.application.routes.draw do
  root 'main#index'

  resources :login, only: [:index]
  resources :users, only: [:update]
  resources :admin, only: [:index]
  resources :categories, except: [:new, :show]
  resources :insects, except: [:new]
  
  
  post 'sign_in', to: "sessions#create"
  get 'sign_out', to: "sessions#destroy", as: 'sign_out'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:slug' => 'categories#show', as: 'category_detail'
end
