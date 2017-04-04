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
            get 'questions-by-title/:title/', to: "questions#questions_by_title"        
              get 'questions-by-title/:title/:page', to: "questions#questions_by_title" 
            scope :tagsearch do
              get ':tag', to: "questions#by_tag"
                get ':tag/:page', to: "questions#by_tag"
            end
            scope :topicsearch do
              get ':topic', to: "questions#by_topic"
                get ':topic/:page', to: "questions#by_topic"
            end
          end
      resources :question_attachments#, only: [:index]

      end

      get 'questions/page/:page', to: "questions#index" 

      scope :user do
        get '/:username', to: "users#get_user_username"         #/user/:username
        
        get '/id/:user_id', to: "users#get_user_id"             #/user/id/:user_id
        
        get '/search/:username', to: "users#search_username"    #/user/search/:username
      end
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

#SOLO USEN GETS DE MOMENTO
#api/v1/questions                                         : Todas las preguntas
#api/v1/questions/page/:page                              : Todas las preguntas en la página x
#api/v1/questions/questions-by-title/:title               : Todas las preguntas por titulo.
#api/v1/questions/:id                                     : Pregunta id
#api/v1/questions/:question_id/question-attachments       : Los attachments de una pregunta
#api/v1/questions/:question_id/question-attachments/:id   : El attachment de una pregunta, SI Y SOLO SI pertenece a esa pregunta
#api/v1/questions/tagsearch/:tag                          : Busca preguntas por tag
#api/v1/questions/topicsearch/:topic                      : Busca preguntas por topic
#api/v1/user/:username                                    : Me retorna un usuario
#api/v1/id/:user_id                                       : Me retorna un usuario
#api/v1/search/:username                                  : Me retorna un resultado de busqueda de username
#api/v1                                                   : Todas las preguntas