# README

Учебное приложение с примером использования дополнительных слоёв абстракции.

Используются:
* Объекты форм для валидации входящий параметров.
* Кейсы для хранения бизнес логики.
* Объекты запроса для хранения логики запроса в БД.
* Сериалайзеры для хранения логики отображения объектов ответов.

Лог с кэшированием:

```
Started GET "/" for 127.0.0.1 at 2022-03-25 00:03:34 +0300
Processing by CitizensController#index as HTML
  Rendering layout layouts/application.html.erb
  Rendering citizens/index.html.erb within layouts/application
  Citizen Load (0.4ms)  SELECT "citizens".* FROM "citizens" WHERE "citizens"."state" = $1  [["state", "alive"]]
  ↳ app/views/citizens/index.html.erb:12
  Rendered collection of citizens/_citizen.html.erb [0 / 7 cache hits] (Duration: 3.0ms | Allocations: 1512)
  Rendered citizens/index.html.erb within layouts/application (Duration: 38.2ms | Allocations: 11816)
  Rendered layout layouts/application.html.erb (Duration: 109.4ms | Allocations: 46180)
Completed 200 OK in 113ms (Views: 106.5ms | ActiveRecord: 5.0ms | Allocations: 47021)


Started GET "/citizens/new" for 127.0.0.1 at 2022-03-25 00:03:44 +0300
Processing by CitizensController#new as HTML
  Rendering layout layouts/application.html.erb
  Rendering citizens/new.html.erb within layouts/application
  Rendered citizens/new.html.erb within layouts/application (Duration: 5.9ms | Allocations: 2597)
  Rendered layout layouts/application.html.erb (Duration: 8.8ms | Allocations: 4647)
Completed 200 OK in 11ms (Views: 9.6ms | ActiveRecord: 0.0ms | Allocations: 5075)


Started POST "/citizens" for 127.0.0.1 at 2022-03-25 00:03:53 +0300
Processing by CitizensController#create as TURBO_STREAM
  Parameters: {"authenticity_token"=>"[FILTERED]", "citizen"=>{"name"=>"name g", "age"=>"16", "gender"=>"male"}, "commit"=>"Create Citizen"}
  Citizen Exists? (0.5ms)  SELECT 1 AS one FROM "citizens" WHERE "citizens"."name" = $1 LIMIT $2  [["name", "name g"], ["LIMIT", 1]]
  ↳ app/use_cases/citizens/create_citizen.rb:18:in `validate_uniqueness_of_name'
  TRANSACTION (0.2ms)  BEGIN
  ↳ app/use_cases/citizens/create_citizen.rb:24:in `create_new_citizen'
  Citizen Create (0.6ms)  INSERT INTO "citizens" ("name", "age", "gender", "state", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["name", "name g"], ["age", 16], ["gender", "male"], ["state", "alive"], ["created_at", "2022-03-24 21:03:53.687102"], ["updated_at", "2022-03-24 21:03:53.687102"]]
  ↳ app/use_cases/citizens/create_citizen.rb:24:in `create_new_citizen'
  TRANSACTION (2.1ms)  COMMIT
  ↳ app/use_cases/citizens/create_citizen.rb:24:in `create_new_citizen'
Redirected to https://localhost/
Completed 302 Found in 16ms (ActiveRecord: 3.3ms | Allocations: 6436)


Started GET "/" for 127.0.0.1 at 2022-03-25 00:03:53 +0300
Processing by CitizensController#index as TURBO_STREAM
  Rendering layout layouts/application.html.erb
  Rendering citizens/index.html.erb within layouts/application
  Citizen Load (0.3ms)  SELECT "citizens".* FROM "citizens" WHERE "citizens"."state" = $1  [["state", "alive"]]
  ↳ app/views/citizens/index.html.erb:12
  Rendered collection of citizens/_citizen.html.erb [7 / 8 cache hits] (Duration: 1.2ms | Allocations: 593)
  Rendered citizens/index.html.erb within layouts/application (Duration: 4.4ms | Allocations: 1615)
  Rendered layout layouts/application.html.erb (Duration: 7.3ms | Allocations: 3820)
Completed 200 OK in 9ms (Views: 7.8ms | ActiveRecord: 0.3ms | Allocations: 4242)


Started GET "/" for 127.0.0.1 at 2022-03-25 00:04:24 +0300
Processing by CitizensController#index as HTML
  Rendering layout layouts/application.html.erb
  Rendering citizens/index.html.erb within layouts/application
  Citizen Load (0.2ms)  SELECT "citizens".* FROM "citizens" WHERE "citizens"."state" = $1  [["state", "alive"]]
  ↳ app/views/citizens/index.html.erb:12
  Rendered collection of citizens/_citizen.html.erb [8 / 8 cache hits] (Duration: 0.9ms | Allocations: 347)
  Rendered citizens/index.html.erb within layouts/application (Duration: 3.6ms | Allocations: 1311)
  Rendered layout layouts/application.html.erb (Duration: 7.1ms | Allocations: 3523)
Completed 200 OK in 9ms (Views: 7.8ms | ActiveRecord: 0.2ms | Allocations: 3883)


Started GET "/" for 127.0.0.1 at 2022-03-25 00:05:06 +0300
Processing by CitizensController#index as HTML
  Rendering layout layouts/application.html.erb
  Rendering citizens/index.html.erb within layouts/application
  Citizen Load (0.3ms)  SELECT "citizens".* FROM "citizens" WHERE "citizens"."state" = $1  [["state", "alive"]]
  ↳ app/views/citizens/index.html.erb:12
  Rendered collection of citizens/_citizen.html.erb [8 / 8 cache hits] (Duration: 0.8ms | Allocations: 344)
  Rendered citizens/index.html.erb within layouts/application (Duration: 3.9ms | Allocations: 1308)
  Rendered layout layouts/application.html.erb (Duration: 7.0ms | Allocations: 3534)
Completed 200 OK in 9ms (Views: 7.4ms | ActiveRecord: 0.3ms | Allocations: 3894)
```
