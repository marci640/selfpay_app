Rails.application.routes.draw do
  get "/rates" => "rates#index"
  get "/rates/new" => "rates#new"
  post "/rates" => "rates#create"
  get "/letters" => "letters#index"
  post "/letters" => "letters#create"
  get "/drugs" => "drugs#index"
end
