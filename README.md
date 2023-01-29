# Fullstack Starter Kit

Powered by PocketBase

The easiest way to create and deploy and full stack application, complete with:

- sqlite database
- database admin dashboard
- customizable Go backend
- user authentication out of the box
- vite react frontend

## Local

`./pocketbase serve`

This will launch a webserver with the following routes:

- `http://http://127.0.0.1:8090/_`: Admin dashboard UI
- `http://http://127.0.0.1:8090/api`:REST API

In a separate terminal, switch to client directory, install, and launch the frontend with:

`cd client && yarn && yarn dev`

## Production

Deploy as single docker container which re-builds client and builds to `pb_public` folder, served by PocketBase.

`docker-compose up`
