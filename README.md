# Fullstack Starter Kit

The easiest way to create and deploy a fullstack web application, complete with:

- sqlite database
- database admin dashboard
- customizable Go backend
- user authentication
- vite frontend

## Local

Run

`./pocketbase serve`

This will launch a webserver with the following routes:

- `http://http://127.0.0.1:8090/_`: Admin dashboard UI
- `http://http://127.0.0.1:8090/api`:REST API

In a separate terminal, be sure you have yarn installed, then start frontend with:

`yarn && yarn dev`

or you can deploy a static version of the site

`docker build -t my-app .`
`docker run -it -rm -p 8090:8090 my-app`

This will simulate a production deployment, but note that the frontend build is static, so you will need to re-build for changes to take effect.

## Production

This project exposes a single Dockerfile which contains the entire app and can be deployed virtually anywhere, but be sure to add a database volume of `pb_data` to persist data between instances

### Example

[Fly.io](https://fly.io/) can be used to create a free hosted instance in minutes with the following steps:

1.) [Install fly](https://fly.io/docs/hands-on/install-flyctl/)
2.) `fly auth login`
3.) `fly launch` - Create name and select `no` for everything
4.) `fly volumes create pb_data --size=1`

Manually add this to the bottom of `fly.toml` to locate the directory to be mounted:

```
  [mounts]
    destination = "/pb/pb_data"
    source = "pb_data"
```

5.) `fly deploy`
