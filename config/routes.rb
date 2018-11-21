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
  get '/employee_details/:id/edit_info'    => 'employee_details#edit_info'
end

