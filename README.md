# Example business logic

Example business logic application with specs based on sinatra

This is my first experience with sinatra and dry-system

## Documentation

If you want to see documentation then copy the contents of the file `docs/api.yml` and paste it in [https://editor.swagger.io](https://editor.swagger.io)

## Run application

Use the [docker compose](https://docs.docker.com/compose/install) to run this application

```bash
docker compose up
```

## Open application in browser

In order to see the failure data about the user follow the link [localhost:9292/users/0](localhost:9292/users/0)

Expected result:

```json
{
  "errors": [
    {
      "status": "404",
      "source": {
        "pointer": "/data/id"
      },
      "title": "user_not_found",
      "detail": "user_not_found"
    }
  ]
}
```

In order to see the successful data about the user follow the link [localhost:9292/users/1](localhost:9292/users/1)

Expected result:

```json
{
  "data": {
    "id": "1",
    "type": "user",
    "attributes": {
      "first_name": "first_name",
      "last_name": "last_name"
    }
  }
}
```

## Run console

If you want to run console use next commands:

```bash
docker compose exec example-business-logic bash
bundle console
require_relative 'system/import'
```

## Run specs

If you want to run specs use next commands:

```bash
docker compose exec example-business-logic bash
bundle exec rspec
```

Expected result:

```
Finished in 0.09079 seconds (files took 1.35 seconds to load)
15 examples, 0 failures
```

P.S. I know that tests need a separate database. Just saved time

## Run rubocop

If you want to run specs use next commands:

```bash
docker compose exec example-business-logic bash
bundle exec rubocop
```

Expected result:

```
Inspecting 30 files
..............................

30 files inspected, no offenses detected
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
