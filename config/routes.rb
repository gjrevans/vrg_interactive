Rails.application.routes.draw do
  namespace :admin do
    root to: "users#index"
    resources :users
  end

  # Base Routes
  root to: "pages#index"
  resource :sitemap, only: :show
  devise_for :users
end
