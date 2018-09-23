Rails.application.routes.draw do
  resources :shortened_urls
  namespace :api do
      namespace :v1 do
        resources :shortened_urls
      end
  end
end
