Rails.application.routes.draw do
  get "/rates/new" => "rates#new"
  post "/rates" => "rates#create"

end
