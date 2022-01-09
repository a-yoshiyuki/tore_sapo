Rails.application.routes.draw do

  get 'test/test'
  get 'shared/index'
  get 'user/home'
  get 'user/index'
  get 'user/:id' => 'user#show', as: 'user_trainer_show'
  root :to => 'info#index'
  resources :relationships, only: [:create, :destroy]

  namespace :api, {format: 'json'} do
    namespace :pj1 do
      resources :users, only: [:index]
    end
  end

  devise_for :users, controllers: {   registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
