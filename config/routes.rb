Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  devise_for :users
  # Base Routes
  root to: "pages#index"

  # Sitemap
  resource :sitemap, only: :show
end
