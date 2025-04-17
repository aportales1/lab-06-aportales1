Rails.application.routes.draw do
  resources :users,    only: %i[index show]
  resources :chats,    only: %i[index show]
  resources :messages, only: %i[index show]

  root "users#index"
end
