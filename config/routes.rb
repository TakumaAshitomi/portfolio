Rails.application.routes.draw do
 devise_for :users
 root "static_pages#home"
 get  "users"     => "users#index"
 post "users/:id" => "users#update"
 post "users/:id/subs" => "users#subscribe"
 delete "users/:id/subs" => "users#unsubscribe"
 get  "users/:id" => "users#show"
 get  "posts"     => "posts#index"
 get  "posts/new" => "posts#new"
 post "posts" => "posts#create"
 get  "posts/:id/edit" => "posts#edit"
 post "posts/:id" => "posts#update"
 delete "/posts/:id" => "posts#destroy"
 get  "posts/:id" => "posts#show"
 get  "managepage" => "management#manage"
end
