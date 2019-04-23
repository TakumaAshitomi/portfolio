Rails.application.routes.draw do
 devise_for :users
 root "static_pages#home"
 get  "users/index"
 get  "users/:id" => "users#show"

end
