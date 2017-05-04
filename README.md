#   README

#   Rutas principales GET

Cinco rutas pedidas para que el Front End Consuma:

 
```
 > api/v1/questions
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
```



#   Todas las rutas GET

Acá un listado de todas las rutas hechas hasta ahora para GET.
```diff
- Cuando es sort=z es sort de usuarios, y cuando es sort=y, es para preguntas.
```
## Notificaciones

```
>api/v1/notifications
*Retorna las notificaciones leidas y no leidas.

{
  "data": {
    "message": "No hay notificaciones para mostrar",
    "not_readed": 0
  }
}

{
  "data": {
    "notifications": [
      {
        "id": 2,
        "body": "MUAnabelle1 se ha postulado a tu pregunta.",
        "read": 0,
        "created_at": "2017-05-04T01:53:56.641Z",
        "updated_at": "2017-05-04T01:53:56.641Z",
        "user_id": 101,
        "question_id": 301
      },
      {
        "id": 1,
        "body": "Fer4Sau se ha postulado a tu pregunta.", //Cuerpo
        "read": 0, // ¿Fue leido?
        "created_at": "2017-05-04T01:53:53.974Z",
        "updated_at": "2017-05-04T01:53:53.974Z",
        "user_id": 101, //Usuario a quien se le envía la notificación
        "question_id": 301 //Pregunta motivo de la notificación
      }
    ],
    "not_readed": 2 //Preguntas no leidas
  }
}

>DELETE api/v1/notifications/:id
*Elimina una notificación especifica

> DELETE api/v1/notifications/clear
*Elimina todas las notificaciones


>POST api/v1/question/:question_id/report
*Envía una notificación anónima al usuario sobre quien envió un reporte y a los admins de quien envió el reporte.
* Parametro:

{
  "reason": "Pregunta en topic equivocado"
}


>POST api/v1/question/:question_id/postulate
*Envía una notificación al usuario de quien se postuló a tu pregunta

>POST api/v1/question/
*Envía una notificación a usuarios subscritos a ese tag 
```

## Rutas para Users

```
> api/v1/users
* Retorna todos los usuarios
* ?page=x&sort=z [Son Sort de usuario]

> api/v1/users/(:username or :id)                          
* Me retorna un usuario                 

> api/v1/users/search/username/:name                       
* Me retorna un resultado de busqueda de username
* ?page=x&sort=z

> api/v1/users/search/first-name/:name                     
* Me retorna un resultado de busqueda de firstname
* ?page=x&sort=z

> api/v1/users/search/last-name/:name                      
* Me retorna un resultado de busqueda de lastname
* ?page=x&sort=z

> api/v1/users/sort               
* Me ordena los usuarios segun su rank         
* ?by=clarity
* ?by=quickness
* ?by=efectiveness

> api/v1/users/(:username or :id)/followers                
* Followers de un usuario               
* ?page=x&sort=z

> api/v1/users/(:username or :id)/following                  
* Follows de un usuario                 
* ?page=x&sort=z

> api/v1/users/:user_id/ranks                              
> Rank específico del usuario          

> api/v1/users/:user_id/domain_ranks                       
* Los niveles en los temas que ha contribuido el usuario
* ?page=x

> api/v1/users/:user_id/domain_ranks/:id                  
* El nivel del usuario en un topic especifico

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

> api/v1/users/:user_id/subscribed                       
* Retorna a que tags está subscrito el usuario
```


## Rutas para Questions

```
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

> api/v1/questions/:question_id/postulated-to-this                 
* Retorna los usuarios postulados a una pregunta
* ?page=x&sort=z

> api/v1/question/has-postulated                           
* Retorna las preguntas que tienen postulados
* ?page=x&sort=y

> api/v1/question/has-not-postulated                       
* Returna las preguntas que no tienen postulados
* ?page=x&sort=y
```
```diff
- api/v1/tagsearch con multiples tags
+ api/v1/tagsearch/tag1,tag2,tag3,to_topic1
-No importa el orden
-Tag puede ser nombre o id
-to_topic no puede estar solo. En su defecto usar [topicsearch]
-En to_topic, topic es el nombre del topic especifico
-Si se busca más de un tag, se buscan las preguntas que sean la intersección de las que tengan ese tag
-Si se busca más de un topic, se busca las preguntas que tengan esos tags y topics
-No mostrará las preguntas a las que se les haya pasado el límite de tiempo
```
## Rutas para Topics

```
> api/v1/topics                               
* Ve todos los topics                 
* ?page=x

> api/v1/topics/(:topic_id or :topic_name)                 
* Muestra un topic especifico             
```

## Rutas para Tags

```
> api/v1/tags                                 
* Ve todos los tags                   
* ?page=x&q=search

> api/v1/tags/(:tag_id or :tag_name)                       
* Muestra un tag especifico             

> api/v1/tags/used-by                                      
* Muestra que usuarios hicieron preguntas en un tag
* ?page=x

> api/v1/tags/search/:tag_name
* Muestra un resultado de coincidencia de búsqueda de tags
* ?page=x
```


## Otras rutas

* api/v1/users/by-level
* api/v1/topic/:topic/questions
* api/v1/tag/:tag/questions

## SORTS:

#### Sorts para Questions

```
localhost:3000/api/v1/questions?sort=y [O cualquier otro que tenga sort como es indicado arriba]
y=>-date:             Los más nuevos a los más viejos
y=>date:              Los más viejos a los más nuevos
y=>-difficulty:       Los más dificiles a los más faciles
y=>difficulty:        Los más faciles
y=>-topic:            De Quimica a Artes Musicales
y=>topic:             De Artes Musicales a Quimica
y=>-user:             Del usuario 100 al usuario 1
y=>user:              Del usuario 1 al usuario 100
y=>-title:            Titulos de la Z a la A
y=>title:             Titulos de la A a la Z
y=>-body:             Cuerpos de la Z a la A
y=>body:              Cuerpos de la A a la Z
y=>-id:               ids del mayor al menor
y=>id:                ids del menor al mayor
```


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
  //"difficulty": 5, <- Este es opcional, default es 1
  "tags": ["Celula", "mitocondria", "Nucleo"],
  "time": 5 //En minutos
}
/********************Codigo******************************/
var data = JSON.stringify({
  "title": "¿Qué es la mitocondria?",
  "body": "En serio, he visto eso tantas veces en el colegio que al fin ni tengo claro que es, necesito ayuda.",
  "topic": "biologia",
  "difficulty": 5,
  "tags": [
    "Celula",
    "mitocondria",
    "Nucleo"
  ],
  "time": 5,
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
xhr.setRequestHeader("postman-token", "0606c44d-c71b-22a1-05c4-0a2571741e04");

xhr.send(data);
```

### 2.1. Para poder agregar Archivos a una pregunta:

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

## 3. Para poder crear Postulaciones:
> POST: localhost:3000/api/v1/questions/:question_id/postulate


```diff
- El parametro :question_id es de nuevo 301, tomado de la url
- El usuario no puede ser el mismo que planteó la pregunta, en este caso, 1
- Solo acepta el id del usuario, ningún otro parametro es necesario
```

#### JSON
```javascript
/*********************JSON******************/
{
}

/*****************Codigo*****************/

var data = JSON.stringify({
  "user_id": 2
});

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/questions/301/postulate");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "e67e01cb-727c-ec5f-4eee-dc05a37e2ccf");

xhr.send(data);
```
## 4. Log In:
> POST: localhost:3000/api/v1/auth/sign_in

```javascript
{
  "email": "juasmartinezbel@unal.edu.co",
  "password": "123456789"
}
/**************************Codigo************************************/
var data = JSON.stringify({
  "email": "juasmartinezbel@unal.edu.co",
  "password": "123456789"
});

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "http://localhost:3000/api/v1/auth/sign_in");
xhr.setRequestHeader("content-type", "application/json");
xhr.setRequestHeader("cache-control", "no-cache");
xhr.setRequestHeader("postman-token", "8d52f876-47bb-60bd-5b1a-801e2a0f383d");

xhr.send(data);
```
#### Esto responderá con un JSON:
```json
{
  "data": {
    "avatar_id": 1,
    "id": 101,
    "email": "juasmartinezbel@unal.edu.co",
    "first_name": "Juan Sebastian",
    "last_name": "Martinez Beltran",
    "username": "juasmartinezbel",
    "description": "",
    "provider": "email",
    "uid": "juasmartinezbel@unal.edu.co",
    "date_created": "2017-05-02T20:21:55.957Z",
    "color": "#551A88"
  }
}
```

#### Y estos headers:
```ruby
Access-Control-Allow-Credentials →true
Access-Control-Allow-Methods →GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD
Access-Control-Allow-Origin →chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop
Access-Control-Max-Age →1728000
Cache-Control →max-age=0, private, must-revalidate
Content-Type →application/json; charset=utf-8
ETag →W/"c8104f0ab9ef885ac0d32b07e93b441d"
Transfer-Encoding →chunked
Vary →Origin
X-Content-Type-Options →nosniff
X-Frame-Options →SAMEORIGIN
X-Request-Id →e89bf5e4-fb39-4851-b1dd-8d150f2f6ff4
X-Runtime →0.708970
X-XSS-Protection →1; mode=block
access-token →kKH_oJejAlGGCfdzl0Hvdw
client →M6R2bgpNyyUqstbT9nADpA
expiry →1494966118
token-type →Bearer
uid →juasmartinezbel@unal.edu.co
```
#### A lo que ustedes solo necesitarán:
```
access-token →kKH_oJejAlGGCfdzl0Hvdw
client →M6R2bgpNyyUqstbT9nADpA
expiry →1494966118
token-type →Bearer
uid →juasmartinezbel@unal.edu.co
```

```diff
-Esto segun lo muestra y usa Postman
```