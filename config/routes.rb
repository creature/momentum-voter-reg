Rails.application.routes.draw do
  resources :voter_registration_actions
  root 'voter_registration_actions#index'
end
