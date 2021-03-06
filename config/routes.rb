Rails.application.routes.draw do
  devise_for :users
    # as :user do
    #   get 'signin', to: 'pages#home' as :new_user_sessions
    #   post 'signin', to: 'pages#home' as :user_session
    #   delete 'signout', to: 'devise/session#destroy' as :destroy_user_session
    # end

  root to: 'pages#home'

  resources :users, only: [:index, :show, :edit, :update] do
    resources :photos
  end

  resources :holidays do
    resources :holiday_invites, only: [:index, :new, :create, :edit, :destroy]
    resources :holiday_albums
  end

  resources :holiday_albums do
    resources :photos
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
