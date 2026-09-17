# Set up
```
* docker compose down
* docker compose up --build
* docker compose ps
* docker compose up
* docker compose exec web rails db:create
* docker compose exec web rails db:migrate
* docker compose exec web rails db:seed

```
## Server up
* docker compose up
```

```
## Server up after setup
* docker compose exec web rails console
* docker compose exec web bundle install

* docker compose exec web rails middleware | grep MiniProfiler
* docker compose exec web rails runner "puts Rails.env; puts Rails.version; puts RUBY_VERSION"
```

```
NoPermissions (FileSystemError): Error: EACCES: permission denied
* sudo chown -R askumar:askumar /home/askumar/code/doctouch
```