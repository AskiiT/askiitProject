Rails.application.routes.draw do

  #mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'User', at: 'api/v1/users', skip: [:omniauth_callback]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #do

  #      end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :questions do
          collection do
            get 'questions/page/:page', to: "questions#index" 
            get 'questions-by-title/:title/', to: "questions#questions_by_title"
            get 'questions-by-title/:title/:page', to: "questions#questions_by_title"
          end
      end
      resources :question_attachments
      resources :followers
      resources :postulates
      resources :question_has_tags
      resources :domain_ranks
      
      resources :tags
      resources :topics
      resources :ranks
      root to: "questions#index"
    end
  end
end