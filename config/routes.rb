Rails.application.routes.draw do
  root "urls#new"
  resources :urls, only: [:new, :create, :show]
  get "/:short_url", to: "urls#redirect" as: :short
end
