Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top' 

  resources :posts do
    resources :comments, only:[:create, :destroy] 
    resources :likes, only:[:create, :destroy] 
    collection do
      get 'confirm'
    end
  end

  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
 
end
