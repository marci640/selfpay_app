Rails.application.routes.draw do
  
  # get "/rates" => "rates#index"
  root to: "rates#index"
  # homepage for site 
  get "/rates/new" => "rates#new"
  # form for patient to compare rates 
  post "/rates" => "rates#create"
  # table comparing rates for patient 
  get "/letters" => "letters#index"
  # letter requesting itemized statement 
  post "/letters" => "letters#create"
  # letter to hospital with table 
  get "/drugs" => "drugs#index"
  # drug madlibs -
  get "/providers" => "providers#index"
  # displays all user/providers in db 
  get "/providers/new" => "providers#new"
  # a form for providers to compare rates 
  post "/providers" => "providers#create"
  # table comparing rates and NPI request 
  post "/search" => "providers#search"
  # search in the navbar for providers
  get "/signup" => "users#new"
  # provider signup page to be a user 
  post "/users" => "users#create"
  # provider becomes a user & sent to show 
  get "/users/:id/edit" => "users#edit"
  # edit user/provider account -
  patch "/users/:id" => "users#update"
  # update user/provider's account -
  get "/users/:id" => "users#show"
  # show page for user/provider 
  delete "/users/:id" => "users#destroy"
  # delete user/provider account 
  get "/login" => "sessions#new"
  # user/provider login page 
  post "/login" => "sessions#create"
  # user/provider logs in & sent to show
  get "/logout" => "sessions#destroy"
  # user/provider logs out and sent to login page 

  namespace :api do 
    namespace :v1 do 
      get '/providers' => 'providers#index'
    end
  end 

end
