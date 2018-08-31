Rails.application.routes.draw do
  namespace :api do
    get "/product" => "products#index"
    get "/product/:id" => "products#show"
  end
end
