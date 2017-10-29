Rails.application.routes.draw do
  # get "/rates" => "rates#index"
  get "/rates/new" => "rates#new"
  post "/rates" => "rates#create"

  get "/letters" => "letters#index"
  post "/letters" => "letters#create"

  get "/drugs" => "drugs#index"
  
  get "/providers/new" => "providers#new"
  post "/providers" => "providers#create"
  
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
