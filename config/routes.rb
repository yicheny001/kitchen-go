Rails.application.routes.draw do
  resources :shopping_lists
  root "recipes#index"
  resources :recipes
  resources :users
  resources :reviews
  resources :bookmarks
  resources :line_items
  resources :stores

  post "/sessions" => "sessions#create"
  get "/sign_in" => "sessions#new", as: 'new_session'
  get "/profile" => "users#profile"
  get "/profile/shopping_list" => "shopping_lists#show"
  get "/log_out" => "sessions#destroy"
  get "/shopping_list/delete_all" => "shopping_lists#delete_all"
end
