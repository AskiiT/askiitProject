#   README

##   Rutas.

Cinco rutas pedidas para que el Front End Consuma:

 

 >  api/v1/questions
 *  Información de todas las preguntas
 * 	?page=x&sort=y

 >  api/v1/users/:id
 *  Información de un usuario dado su id:

 
 >  api/v1/questions/tagsearch/:tag
 *  Información de preguntas filtradas por tag:
 *	page=x&sort=y
 

 >  api/v1/questions/:id
 *  Información de una pregunta dado su id:

 >  api/v1/tags(/page/:page) 
 *  Retornar todos los tags
 * 	?page=x










# SORTS

* Se pueden colocar como parametro ?sort=TYPE al final de la url correspondiente. Los tipos son:  

#### Newest
> Retorna los más nuevos primero

#### Oldest
> Retorna los más antiguos primero

#### Easiest
> Retorna los más faciles primero

#### Hardest
> Retorna los más dificiles primero


#   Todas las rutas GET

Acá un listado de todas las rutas hechas hasta ahora para GET.









## Rutas para Users

> api/v1/auth                                             
* Authentication for users 

> api/v1/users
* Retorna todos los usuarios
* ?page=x

> api/v1/users/(:username or :id)                          
* Me retorna un usuario 								

> api/v1/users/search/username/:name                       
* Me retorna un resultado de busqueda de username
* ?page=x

> api/v1/users/search/first-name/:name                     
* Me retorna un resultado de busqueda de firstname
* ?page=x

> api/v1/users/search/last-name/:name                      
* Me retorna un resultado de busqueda de lastname
* ?page=x

> api/v1/users/(:username or :id)/followers                
* Followers de un usuario 							
* ?page=x

> api/v1/users/(:username or :id)/following                  
* Follows de un usuario 								
* ?page=x

> api/v1/users/:user_id/ranks                              
> Rank específico del usuario          

> api/v1/users/:user_id/domain_ranks                       
* Los niveles en los temas que ha contribuido el usuario
* ?page=x

> api/v1/users/:user_id/domain_ranks/:id                  
* El nivel del usuario especifico

> api/v1/users/:user_id/topic/:id
* El nivel de un usuario en un tema dado

> api/v1/users/:user_id/my-questions                       
* Las preguntas hechas por un usuario
* ?page=x&sort=y

> api/v1/users/:user_id/postulated
* Las preguntas a las que un usuario está postulado
* ?page=x&sort=y


> api/v1/users/:id/who-postulated                          
* Retorna quien se postuló a este usuario

> api/v1/users/:id/who-it-postulated                       
* Retorna a que usuarios se postuló este usuario

## Rutas para Questions

> api/v1                                                   
* Todas las preguntas

> api/v1/questions                                         
* Todas las preguntas
* ?page=x&sort=y

> api/v1/questions/questions-by-title/:title               
* Todas las preguntas por titulo.
* ?page=x&sort=y

> api/v1/questions/:id                                     
* Pregunta id

> api/v1/questions/:question_id/question-attachments       
* Los attachments de una pregunta

> api/v1/questions/:question_id/question-attachments/:id   
* El attachment de una pregunta, SI Y SOLO SI pertenece a esa pregunta

> api/v1/questions/tagsearch/(:tag_id or :tag_name)           
* Busca preguntas por tag
* ?page=x&sort=y

> api/v1/questions/topicsearch/(:topic_id or :topic_name)     
* Busca preguntas por topic
* ?page=x&sort=y

> api/v1/questions/:question_id/topic                      
* Retorna el topic del question

> api/v1/questions/:question_id/tags                       
* Retorna los tags de una pregunta

> api/v1/questions/:question_id/postulated                 
* Retorna los usuarios postulados a una pregunta
* ?page=x

> api/v1/question/has-postulated                           
* Retorna las preguntas que tienen postulados
* ?page=x&sort=y

> api/v1/question/has-not-postulated                       
* Returna las preguntas que no tienen postulados
* ?page=x&sort=y


## Rutas para Topics


> api/v1/topics                               
* Ve todos los topics 								
* ?page=x

> api/v1/topics/(:topic_id or :topic_name)                 
* Muestra un topic especifico 						

> api/v1/topics/:topic_id/tags                             
* Muestra los tags de un topic 						
* ?page=x

> api/v1/topics/search/:tag_name
* Muestra un resultado de búsqueda de tags
* ?page=x

## Rutas para Tags

> api/v1/tags                                 
* Ve todos los tags 									
* ?page=x

> api/v1/tags/(:tag_id or :tag_name)                       
* Muestra un tag especifico							

> api/v1/tags/used-by                                      
* Muestra que usuarios hicieron preguntas en un tag
* ?page=x

> api/v1/topics/search/:tag_name
* Muestra un resultado de búsqueda de tags
* ?page=x


## Otras rutas

* api/v1/users/sort
* api/v1/users/by-level
* api/v1/topic/:topic/questions
* api/v1/tag/:tag/questions