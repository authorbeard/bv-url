Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :shortened_urls, only: [:index, :create]
      end
  end

  root "shortened_urls#index"
  get "/:key" => "shortened_urls#show"
end
