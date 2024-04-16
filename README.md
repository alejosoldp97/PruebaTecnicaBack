
# Prueba Tecnica Frogmi Ruby 

Este respositorio contiene el Backend correspondiente a la prueba técnica para desarrollador Junior en Ruby. Las features de la aplicación se exponen más adelante.


## Features

- Endpoint para exponer los datos sísmicos.
- Endpoint para crear y recuperar comentarios.
- Paginación.
- Tarea asíncrona para la actualización de los datos.
- Filtrado por número de items y por tipo de magnitud.


## Getting Started
Versiones requeridas:
```
Ruby 3.2.2
Rails 7.0.8.1
Redis-server 7.2

```



## Setup

Para ejecutar esta aplicación:

```bash
  bundle install
  rails db:create
  rails db:migrate
  rake earthquakes:update_data
```


## Usage
Levantar el servidor en el puerto 3000

```
  rails s -p 3000
```

Correr servidor de redis

```
  redis-server

```
Levantar sidekiq

```
  bundle exec sidekiq

```
