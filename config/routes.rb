Rails.application.routes.draw do

  #mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callback]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do      

      resources :users do                     #api/v1/users(get,post)  api/v1/users/:id(put,patch,delete)
          collection do   
            get 'search/:username',     to: 'users#search_username'     #api/v1/users/search/:username (get)
            get 'page/:page',           to: 'users#index'               #api/v1/users/page/:id (get)
          end
          
          get 'my-questions',           to: 'users#my_questions'        #api/v1/users/:id/my-questions (get)
          get 'following',              to: 'followers#following'       #api/v1/users/:id/following (get)
          get 'followers',              to: 'followers#index'           #api/v1/users/:id/followers (get)
          
          get 'rank',                   to: 'ranks#by_user'             #api/v1/users/:id/rank (get)
          get 'domain-rank',            to: 'domain_ranks#by_user'      #api/v1/users/:id/domain-rank (get)
          get 'domain-rank/page/:page', to: 'domain_ranks#by_user'      #api/v1/users/:id/domain-rank/page/:page (get)
          get 'domain-rank/:topic_id',  to: 'domain_ranks#by_user_and_topic'  #api/v1/users/:id/domain-rank/:topic_id (get)
          
      end

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
        get 'topic', to: 'topics#topics_in_question'
        get 'tags', to: 'tags#tags_in_question'
      end

      get 'questions/page/:page', to: "questions#index"

      #resources :followers
      resources :postulates
      resources :question_has_tags
      resources :domain_ranks
      
      resources :tags
      resources :topics
      resources :ranks
      root to: "questions#index"
    end
  resources :postulates
  end
end

#SOLO USEN GETS DE MOMENTO
#api/v1/questions                                         : Todas las preguntas
#api/v1/questions/page/:page                              : Todas las preguntas en la página x
#api/v1/questions/questions-by-title/:title               : Todas las preguntas por titulo.
#api/v1/questions/:id                                     : Pregunta id
#api/v1/questions/:question_id/question-attachments       : Los attachments de una pregunta
#api/v1/questions/:question_id/question-attachments/:id   : El attachment de una pregunta, SI Y SOLO SI pertenece a esa pregunta
#api/v1/questions/tagsearch/(:tag_id|:tag_name)           : Busca preguntas por tag
#api/v1/questions/topicsearch/(:topic_id|:topic_name)     : Busca preguntas por topic
#api/v1/questions/:question_id/topic                      : Retorna el topic del question
#api/v1/questions/:question_id/tags                       : Retorna el tags
#api/v1/users/(:username||:id)                            : Me retorna un usuario
#api/v1/users/search/:username                            : Me retorna un resultado de busqueda de username
#api/v1                                                   : Todas las preguntas
#api/v1/users/(:username||:id)/followers                  : Followers de un usuario
#api/v1/users/(:username||:id)/follows                    : Follows de un usuario
#api/v1/auth                                              : Authentication for users