Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get '/destinations' => 'destinations#index'
    get '/destinations/:id' => 'destinations#show'

    get '/trips' => 'trips#index'
    get '/trips/:id' => 'trips#show'
  end
end
