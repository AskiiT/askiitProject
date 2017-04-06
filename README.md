#   README

##   Rutas.

Cinco rutas pedidas para que el Front End Consuma:

 

 *  api/v1/questions
 >  Información de todas las preguntas
 

 *  api/v1/users/:id
 >  Información de un usuario dado su id:

 
 *  api/v1/questions/tagsearch/:tag
 >  Información de preguntas filtradas por tag:

 
 *  api/v1/questions/:id
 >  Información de una pregunta dado su id:


 *  api/v1/tags(/page/:page) 
 >  Retornar todos los tags












##   Todas las rutas GET

Acá un listado de todas las rutas hechas hasta ahora para GET.






# Rutas para Users

* api/v1/auth                                             
> Authentication for users 

* api/v1/users/(:username or :id)                          
> Me retorna un usuario 								

* api/v1/users/search/:username                            
> Me retorna un resultado de busqueda por username 	

* api/v1/users/(:username or :id)/followers                
> Followers de un usuario 							

* api/v1/users/(:username or :id)/following                  
> Follows de un usuario 								

* api/v1/users/:user_id/ranks                              
> Rank específico del usuario          

* api/v1/users/:user_id/domain_ranks                       
> Los niveles en los temas que ha contribuido el usuario

* api/v1/users/:user_id/domain_ranks/:id(/page/:page )                  
> El nivel del usuario en un tema específico

* api/v1/users/:user_id/my-questions                       
> Las preguntas hechas por un usuario

# Rutas de questions

* api/v1                                                   
> Todas las preguntas 

* api/v1/questions                                         
> Todas las preguntas 

* api/v1/questions/page/:page                              
> Todas las preguntas en la página x 					

* api/v1/questions/questions-by-title/:title               
> Todas las preguntas por titulo. 					

* api/v1/questions/:id                                     
> Pregunta id 										

* api/v1/questions/:question_id/question-attachments       
> Los attachments de una pregunta 					

* api/v1/questions/:question_id/question-attachments/:id   
> El attachment de una pregunta, SI pertenece a ella 	

* api/v1/questions/tagsearch/(:tag_id or :tag_name)        
> Busca preguntas por tag 							

* api/v1/questions/topicsearch/(:topic_id or :topic_name)   
> Busca preguntas por topic 							

* api/v1/questions/:question_id/topic                      
> Retorna el topic del question 						

* api/v1/questions/:question_id/tags                       
> Retorna el tags 									

* api/v1/questions/:question_id/postulated
> Retorna los postulados a dicha pregunta


# Rutas para Topics


* api/v1/topics(/page/:page)                               
> Ve todos los topics 								

* api/v1/topics/(:topic_id or :topic_name)                 
> Muestra un topic especifico 						

* api/v1/topics/:topic_id/tags                             
> Muestra los tags de un topic 						


# Rutas para Tags

* api/v1/tags(/page/:page)                                 
> Ve todos los tags 									

* api/v1/tags/(:tag_id or :tag_name)                       
> Muestra un tag especifico							

* api/v1/tags/used-by                                      
> Muestra que usuarios hicieron preguntas en un tag