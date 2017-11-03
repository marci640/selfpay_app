Rails.application.routes.draw do
  
  get "/rates" => "rates#index"
  # homepage for site -
  get "/rates/new" => "rates#new"
  # form for patient to compare rates +
  post "/rates" => "rates#create"
  # table comparing rates for patient +
  get "/letters" => "letters#index"
  # letter requesting itemized statement +
  post "/letters" => "letters#create"
  # letter to hospital with table +
  get "/drugs" => "drugs#index"
  # drug madlibs -
  get "/providers" => "providers#index"
  # displays all user/providers in db +
  get "/providers/new" => "providers#new"
  # a form for providers to compare rates +
  post "/providers" => "providers#create"
  # table comparing rates and NPI request +
  get "/providers/:id" => "providers#show"
  # show page for providers +
  post "/search" => "providers#search"
  # search in the navbar for providers
  get "/signup" => "users#new"
  # provider signup page to be a user +
  post "/users" => "users#create"
  # provider becomes a user & sent to show +
  get "/users/:id/edit" => "users#edit"
  # edit users account -
  patch "/users/:id" => "users#update"
  # update provider's account -
  delete "/users/:id" => "users#destroy"
  # delete provider's account -
  get "/login" => "sessions#new"
  # provider login page +
  post "/login" => "sessions#create"
  # provider logs in & sent to show +
  get "/logout" => "sessions#destroy"
  # provider logs out and sent to login page +

end
