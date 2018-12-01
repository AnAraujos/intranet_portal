Rails.application.routes.draw do
  get 'page/jobs_list'
  get 'page/myjobs'
  resources :employee_jobs
  resources :jobs
  resources :sub_stores
  resources :stores
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :employee_details
  get 'page/home'
  devise_for :users

  get '/home' => 'page#home'
  get '/myjobs' => 'page#myjobs'
  get '/employee' => 'employee_details#index'
  get '/employee_details/:id/show'    => 'employee_details#show'
  get '/employee_details/:id/edit'    => 'employee_details#edit'

  get '/stores' => 'stores#index'

  get '/substores' => 'sub_stores#index'

  get '/jobs' => 'jobs#index'
  post '/jobs_add' => 'employee_jobs#new', :as => :add_employee_job
  get '/jobs_add' => 'employee_jobs#new', :as => :get_add_employee_job


  post 'employee_jobs/new' => 'employee_jobs#new'
  get 'available_employers' => 'employee_details#find_employers_given_asset_and_job_id'

  post '/jobs_employee' => 'jobs#show_id', :as => :jobs_employee
  get '/jobs_employee' => 'jobs#show_id', :as => :get_jobs_employee

  get 'save' => 'employee_jobs#edit_situation', :as => :save    

  post '/employee_jobs/:id/edit'    => 'employee_jobs#edit'

end

