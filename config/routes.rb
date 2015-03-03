Rails.application.routes.draw do
  devise_for :views
  root to: "posts#index"
  resources :posts

end
