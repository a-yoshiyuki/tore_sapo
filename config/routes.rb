Rails.application.routes.draw do

  root :to => 'info#index'
  get 'test/test'
  get 'user/home'
  get 'user/index'
  get 'user/:id' => 'user#show', as: 'user_trainer_show'
  
  post 'relationships' => 'relationships#create'
  delete 'relationships/:id' => 'relationships#destroy', as: 'destroy_relationship'
  get 'followings/user/:id' => 'relationships#followings', as: 'followings'
  get 'followers/user/:id' => 'relationships#followers', as: 'followers'

  devise_for :users, controllers: {   registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
