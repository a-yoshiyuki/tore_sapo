Rails.application.routes.draw do

  get 'test/index'
  get 'shared/index'
  get 'home/index'
  root :to => 'info#index'

  namespace :api, {format: 'json'} do
    namespace :pj1 do
      resources :users, only: [:index]
    end
  end

  devise_for :users, controllers: {   registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
