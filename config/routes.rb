Rails.application.routes.draw do
 devise_for :users
 root "static_pages#home"
 get  "users"     => "users#index"
 post "users/:id" => "users#update"
 get  "users/:id" => "users#show"
 get  "posts"     => "posts#index"
 get  "posts/:id" => "posts#show"
end
