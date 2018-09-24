Rails.application.routes.draw do

  root "api/v1/shortened_urls#index"
  get "/:key" => "api/v1/shortened_urls#show"

  namespace :api do
      namespace :v1 do
        resources :shortened_urls
      end
  end
end
