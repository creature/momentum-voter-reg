Rails.application.routes.draw do
  resources :voter_registration_actions, only: [:index, :new, :create, :show]
  namespace :admin do
    resources :voter_registration_actions
    root 'voter_registration_actions#index'
  end
  root 'voter_registration_actions#index'
end
