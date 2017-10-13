Rails.application.routes.draw do
  get "/rates" => "rates#new"
  post "/rates" => "rates#create"

end
