Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :employee_details
  get 'page/home'
  devise_for :users

  get '/home' => 'page#home'
  get '/employee' => 'employee_details#index'
  get '/employee_details/:id/show'    => 'employee_details#show'
end

