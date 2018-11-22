Rails.application.routes.draw do
  resources :sub_stores
  resources :stores
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :employee_details
  get 'page/home'
  devise_for :users

  get '/home' => 'page#home'
  get '/employee' => 'employee_details#index'
  get '/employee_details/:id/show'    => 'employee_details#show'
  get '/employee_details/:id/edit'    => 'employee_details#edit'

  get '/stores' => 'stores#index'

  get '/substores' => 'sub_stores#index'
end

