#   README

##   Rutas.

Cinco rutas pedidas para que el Front End Consuma:

 

 >  api/v1/questions
 *  Información de todas las preguntas
 *  ?page=x&sort=y

 >  api/v1/users/:id
 *  Información de un usuario dado su id:

 
 >  api/v1/questions/tagsearch/:tag
 *  Información de preguntas filtradas por tag:
 *  page=x&sort=y
 

 >  api/v1/questions/:id
 *  Información de una pregunta dado su id:

 >  api/v1/tags(/page/:page) 
 *  Retornar todos los tags
 *  ?page=x










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

> api/v1/questions/:question_id/postulate           
* Me postulo a una pregunta

> api/v1/questions/:question_id/postulate                
* Dejo de estar postulado a una pregunta


> api/v1/questions/:question_id/postulated-to-this                 
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



# POST
##### Disclaimer: A continuación la forma en que POSTMAN permite postear los siguientes métodos en una función tipo Javascript:

## 1. Para poder registrar un usuario:
> POST: localhost:3000/api/v1/auth

#### Json:
```javascript
/********************Json******************************/
{
  "email": "juasmartinezbel@unal.edu.co",
    "first_name": "Juan Sebastian",
    "last_name": "Martinez Beltran",
    "username": "juasmartinezbel",
    "password": "123456789",
    "color": "#551A8B"
}
/********************Codigo***********************/
var data = JSON.stringify({
      "email": "juasmartinezbel@unal.edu.co",
      "first_name": "Juan Sebastian",
      "last_name": "Martinez Beltran",
      "username": "juasmartinezbel",
      "password": "123456789",
      "color": "#551A8B"
});

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/auth");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "9a8f1eac-9337-6a62-c77c-9cd127e83450");

xhr.send(data);
  
```

#### JS sin JSON. Form Data
```javascript
var data = new FormData();
data.append("username", "juasmartinezbel");
data.append("first_name", "Juan Sebastian");
data.append("last_name", "Martinez Beltran");
data.append("email", "juasmartinezbel@unal.edu.co");
data.append("color", "#551A8B");
data.append("password", "123456789");

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/auth");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "48eb8d0d-b47a-7765-2cda-92e2cc9384cd");

xhr.send(data);
```
## 2 Para poder postear una pregunta:
> POST: localhost:3000/api/v1/questions

#### JSON [No es posible sin json]
```javascript
/********************Json******************************/
{
  "title": "¿Qué es la mitocondria?",
  "body": "En serio, he visto eso tantas veces en el colegio que al fin ni tengo claro que es, necesito ayuda.",
  "topic": "biologia",
  "user_id": 1,
  //"difficulty": 5 < Este es opcional, defaut es 1. Quitar coma arriba
}
/********************Codigo******************************/
var data = JSON.stringify({
  "title": "¿Qué es la mitocondria?",
  "body": "En serio, he visto eso tantas veces en el colegio que al fin ni tengo claro que es, necesito ayuda.",
  "topic": "biologia",
  "user_id": 1,
  "difficulty": 5
});

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/questions");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "1c4b78a6-01c1-19a3-e827-ac4a75da9b85");

xhr.send(data);
```

### 2.1. Para poder agregar tags a una pregunta:
> POST: localhost:3000/api/v1/questions/:question_id/add-tag

```diff
- La pregunta DEBE crearse primero.
- Si el tag no fue creado, lo creará automaticamente al topic de la pregunta.
- Recordar que el nombre de tag es ÚNICO.
- Solo un Tag por request.
- En el ejemplo, :question_id es 301, se asocia automaticamente
```

#### JSON
```javascript
/********************Json******************************/
{
  "tag_id": "Celula"
}
/********************Codigo******************************/
var data = JSON.stringify({
  "tag_id": "Celula"
});

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/questions/301/add-tag");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "bd2635cb-7fbb-28f3-c346-3aedfaf23ff1");

xhr.send(data);
```
### 2.2. Para poder agregar Archivos a una pregunta:

> POST: localhost:3000/api/v1/questions/:question_id/question_attachments

```diff
- No sé como puedan hacer este, por favor revisar la colección de Postman
- El caso con :question_id es el mismo que con el anterior
```
#### JS sin JSON. Form Data, NO se puede con JSON, necesita archivos.
```javascript
var data = new FormData();
data.append("question_attachment[attachment]", "C94SI7GUwAEJGq-.jpg");

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/questions/301/question_attachments");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "b066b169-f2c5-ee1c-4550-ceb36cb08bcd");

xhr.send(data);
```

## 3. Para poder crear Tags aparte:
> POST: localhost:3000/api/v1/questions/:question_id/question_attachments

#### JSON [No permite con Form]
```javascript
/*********************JSON******************/
{
  "tag_name": "Defensas",
  "topic":  "Biologia"
}

/*****************Codigo*****************/

var data = JSON.stringify({
  "tag_name": "Defensas",
  "topic": "Biologia"
});

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/tags");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "34e1ae74-0cfb-9f4e-cf5e-674728554d0d");

xhr.send(data);
```

