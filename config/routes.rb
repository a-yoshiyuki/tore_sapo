Rails.application.routes.draw do

  get 'test/index'
  get 'shared/index'
  get 'home/index'
  root :to => 'info#index'
  devise_for :users, controllers: {   registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
