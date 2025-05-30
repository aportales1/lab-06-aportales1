Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :chats
  resources :messages

  authenticated :user do
    root to: "users#index", as: :authenticated_root
  end
  
  unauthenticated do
    root to: redirect('/users/sign_in'), as: :unauthenticated_root
  end
  
end
