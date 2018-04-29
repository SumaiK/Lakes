Rails.application.routes.draw do
  devise_for :users
    # as :user do
    #   get 'signin', to: 'pages#home' as :new_user_sessions
    #   post 'signin', to: 'pages#home' as :user_session
    #   delete 'signout', to: 'devise/session#destroy' as :destroy_user_session
    # end

  root to: 'pages#home'
  resources :user, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
