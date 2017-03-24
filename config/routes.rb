Rails.application.routes.draw do
  resources :question_attachments
  resources :followers
  resources :postulates
  resources :question_has_tags
  resources :domain_ranks
  resources :questions
  resources :tags
  resources :topics
  resources :ranks
  #mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callback]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
