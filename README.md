# Prueba Técnica Frogmi Ruby 

Este respositorio contiene el Backend correspondiente a la prueba técnica para desarrollador Junior en Ruby. Esta aplicación expone los endpoint para consultar datos sísmicos, crear y recuperar comentarios asociados a éstos. Además de una tarea asíncrona para actualizar datos cada  hora.


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
