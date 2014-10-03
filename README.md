folgian
=======

Request tracing cowboy middleware.  Adds a UUID to lager logging metadata and an HTTP response header.

```erlang
    cowboy:start_http(http, 100, [{port, 8080}],
                      [{env, [{dispatch, Dispatch}]},
                       {middlewares, [cowboy_router, folgian, cowboy_handler]}])
```
