Rails.application.routes.draw do

  #mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callback]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do      
      resources :avatars

      resources :users do                                               #api/v1/users(get,post)  api/v1/users/:id(put,patch,delete)
          collection do   
            scope :search do 
              get 'username/:username',       to: 'users#search_username'     #api/v1/users/search/username/:name (get)
              get 'first-name/:username',     to: 'users#search_firstname'     #api/v1/users/search/first-name/:name (get)
              get 'last-name/:username',      to: 'users#search_lastname'     #api/v1/users/search/last-name/:name (get)

            end

            #///part of others\\\\:
            get '/sort', to: 'users#sort'
            get 'by-level', to: 'users#by_level'
          end
          

          get 'my-questions',           to: 'questions#my_questions'    #api/v1/users/:id/my-questions (get)

          ###
          #Falta poder seguir a alguien y dejar de seguir
          ###

          #api/v1/users/:id_followed/follow   followers#create
          #api/v1/users/:id_followed/unfollow folowers#destroy

          #api/v1/users/:id_users/follow?=my_id 

          resources :followers,         only: [:index] 
              #api/v1/users/:id/followers (get) Me muestra mis seguidores
          get 'following',              to: 'followers#following'       
              #api/v1/users/:id/following (get) Me muestra a quién sigo
          post 'follow',                to: 'followers#create'
          #api/v1/users/:followed_id/follow (post) Me permite seguir a alquien, 
          #debo mandar mi id como un parametro en el post llamado "follower_id"
          delete 'unfollow',            to: 'followers#destroy'
          #api/v1/users/:folloed_id/unfollow(delete) Me permite dejar de seguir a alquien,
          #debo mandar mi id como un parametro en el post llamado "follower_id"

          resources :ranks                                              #api/v1/users/:id/ranks (get, post) #api/v1/users/:id/ranks/1(put,patch, delete)
          get 'rank',                   to: 'ranks#index'
          resources :domain_ranks do
            collection do
              get 'topic/:id', to: 'domain_ranks#topics'
            end
          end

          get 'postulated',             to: 'questions#is_postulated_to' #api/v1/users/:id/postulated (get)
          get 'who-postulated',         to: 'users#who_postulated'  #api/v1/users/:user_id/who-postulated
          get 'who-it-postulated',      to: 'users#who_it_postulated'
      end
          get 'home', to: 'users#welcum'

      resources :questions do
          collection do
            get 'questions-by-title/:title/', to: "questions#questions_by_title"
            scope :tagsearch do
              get ':tag', to: "questions#by_tag"
            end

            scope :topicsearch do
              get ':topic', to: "questions#by_topic"
            end

            get 'has-postulated', to: 'questions#has_postulated'
            get 'has-not-postulated', to: 'questions#has_not_postulated'
          end

        resources :question_attachments #De todo
        #resources :question_has_tags
        post 'add-tags', to: 'question_has_tags#create'
        delete 'remove-tags', to: 'question_has_tags#destroy'

        get 'topic', to: 'topics#topics_in_question'
        get 'tags', to: 'tags#tags_in_question'

        post    'postulate',    to: 'postulates#create'
        delete  'unpostulate',  to: 'postulates#destroy'
        get 'postulated-to-this', to: 'postulates#postulated_to'

      end

      resources :topics do
        get 'tags', to: "tags#topic_tags"
        get 'used-by', to: "topics#used_by"
        collection do
          get 'search/:topic_name',  to: 'topics#search'
          #//otras\\
          get ':topic/questions', to: "questions#by_topic"
        end


      end

      resources :tags do
        get 'used-by', to: "tags#used_by"
        collection do
         get 'search/:tag_name',  to: 'tags#search'
          #//otras\\
         get ':tag/questions', to: "questions#by_tag"
        end
      end

      #resources :postulates
      #resources :question_has_tags
      #resources :domain_ranks
      #resources :ranks
      #resources :question_attachments
      root to: "questions#index" 

    end
  end
end

#SOLO USEN GETS DE MOMENTO
#api/v1                                                   : Todas las preguntas
#api/v1/questions                                         : Todas las preguntas
#api/v1/questions/questions-by-title/:title               : Todas las preguntas por titulo.
#api/v1/questions/:id                                     : Pregunta id
#api/v1/questions/:question_id/question-attachments       : Los attachments de una pregunta
#api/v1/questions/:question_id/question-attachments/:id   : El attachment de una pregunta, SI Y SOLO SI pertenece a esa pregunta
#api/v1/questions/tagsearch/(:tag_id|:tag_name)           : Busca preguntas por tag
#api/v1/questions/topicsearch/(:topic_id|:topic_name)     : Busca preguntas por topic
#api/v1/questions/:question_id/topic                      : Retorna el topic del question
#api/v1/questions/:question_id/tags                       : Retorna el tags
#api/v1/questions/:question_id/postulated                 : Retorna los usuarios postulados a una pregunta
#api/v1/question/has-postulated                           : Retorna las preguntas que tienen postulados
#api/v1/question/has-not-postulated                       : Returna las preguntas que no tienen postulados

#api/v1/auth                                              : Authentication for users
#api/v1/users/(:username||:id)                            : Me retorna un usuario
#api/v1/users/search/username/:name                       : Me retorna un resultado de busqueda de username
#api/v1/users/search/first-name/:name                     : Me retorna un resultado de busqueda de username
#api/v1/users/search/last-name/:name                      : Me retorna un resultado de busqueda de username
#api/v1/users/(:username||:id)/followers                  : Quien sigue al usuario
#api/v1/users/(:username||:id)/following                  : A quien sigue un usuario
#api/v1/users/:user_id/ranks                              : Rank específico del usuario          
#api/v1/users/:user_id/domain_ranks                       : Los niveles en los temas que ha contribuido el usuario
#api/v1/users/:user_id/domain_ranks/:id                   : EL nivel del usuario en un tema específico
#api/v1/users/:user_id/domain_ranks/page/:page            : Los niveles en los temas que ha contribuido el usuario en la pagina x
#api/v1/users/:user_id/my-questions                       : Las preguntas hechas por un usuario
#api/v1/users/:user_id/postulated                         : Retorna las preguntas que se postularon a una pregunta
#api/v1/users/:id/who-postulated                          : Retorna quien se postuló a este usuario
#api/v1/users/:id/who-it-postulated                       : Retorna a que usuarios se postuló este usuario

#api/v1/topics/(:topic_id||:topic_name)                   : Muestra un topic especifico
#api/v1/topics/:topic_id/tags                             : Muestra los tags de un topic
#api/v1/topics/search/:topic_name                         : Muestra un resultado de búsqueda de topics

#api/v1/tags/(:tag_id||:tag_name)                         : Muestra un tag especifico
#api/v1/tags/used-by                                      : Muestra que usuarios hicieron preguntas en un tag
#api/v1/tags/search/:tag_name


##Others
#api/v1/users/sort
#api/v1/users/by-level
#api/v1/topic/:topic/questions
#api/v1/tag/:tag/questions