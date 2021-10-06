# Тестовое задание для Shakuro

## Установка
### Docker
* склонировать проект: `git clone git@github.com:gpunker/golovachev_shakuro_test.git`
* перейти в папку с проектом
* скопировать файл **.env.dist** в файл **.env**: `cp .env.dist .env`
* запустить проект: `docker-compose up`; или сначала сбилдить `docker-compose build`, а затем запустить `docker-compose start`
* создать БД, выполнить миграции, залить сиды: `docker-compose exec app bundle exec rails db:setup`; или по отдельности: `docker-compose exec app bundle exec rails db:create`, `docker-compose exec app bundle exec rails db:migrate`, `docker-compose exec app bundle exec rails db:seed`
* можно работать

### Локально
* склонировать проект: `git clone git@github.com:gpunker/golovachev_shakuro_test.git`
* перейти в папку с проектом
* скопировать файл **.env.dist** в файл **.env**: `cp .env.dist .env`
* установить гемы `bundle install`
* по-желанию создать пользователя в postgres
* в **config/database.yml** поменять на свои данные БД
* создать БД, выполнить миграции, залить сиды: `bundle exec rails db:setup`; или по отдельности: `bundle exec rails db:create`, `bundle exec rails db:migrate`, `bundle exec rails db:seed`
* запустить проект: `bundle exec rails s`
* можно работать

## Тесты
После прохождения тестов генерируется статистика покрытия, которая хранится в папке **coverage**.

Для **docker** можно посмотреть по адресу `http://localhost:8096`.
### Docker
`docker-compose exec app bundle exec rspec`
### Локально
`bundle exec rspec`

## Swagger
### Docker
`http://localhost:8095`
### Локально
Файл сваггера лежит в папке **swagger** в корне проекта
