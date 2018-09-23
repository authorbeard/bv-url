Rails.application.routes.draw do

  root "api/vi/shortened_urls#index"
  namespace :api do
      namespace :v1 do
        resources :shortened_urls
      end
  end
end
