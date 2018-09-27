require "sidekiq/web"

Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :shortened_urls, only: [:index, :create]
      end
  end

  mount Sidekiq::Web => "/workers"

  get "/:key" => "shortened_urls#show", as: "short_url"

  root "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
