# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users
  root "static_pages#home"
  get  "users" => "users#index"
  post "users/guestlogin" => "users#guestlogin"
  post "users/:id" => "users#update"
  post "users/:id/subs" => "users#subscribe"
  delete "users/:id" => "users#destroy"
  delete "users/:id/subs" => "users#unsubscribe"
  get  "users/:id" => "users#show"
  get  "posts" => "posts#index"
  get  "posts/new" => "posts#new"
  post "posts" => "posts#create"
  get  "posts/:id/edit" => "posts#edit"
  post "posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
  get  "posts/:id" => "posts#show"
  post "posts/:id/hebutton" => "posts#addhe"
  delete "posts/:id/hebutton" => "posts#deletehe"
  get  "managepage" => "management#manage"
  get  "contacts" => "contact#new"
  post "contacts" => "contact#create"
end
