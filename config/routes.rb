Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :shortened_urls, only: [:index, :create]
      end
  end

  get "/:key" => "shortened_urls#show"
  root "api/v1/shortened_urls#index"
end
