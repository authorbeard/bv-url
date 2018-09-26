Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :shortened_urls, only: [:index, :create]
      end
  end

  get "/:key" => "shortened_urls#show"
  root "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
