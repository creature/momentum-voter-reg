Rails.application.routes.draw do
  resources :voter_registration_actions, only: [:new, :create, :show], path: '/events'
  namespace :admin do
    resources :voter_registration_actions
    root 'voter_registration_actions#index'
  end
  root 'voter_registration_actions#index'
end
