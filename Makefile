up: docker-up

init: docker-clear docker-up api-composer frontend-env frontend-install frontend-build storage-permissions

docker-clear:
	docker-compose down --remove-orphans

docker-up:
	docker-compose up --build -d

api-composer:
	docker-compose exec api-php-cli composer install

frontend-env:
	docker-compose exec frontend-nodejs rm -f .env.local
	docker-compose exec frontend-nodejs ln -sr .env.local.example .env.local

frontend-install:
	docker-compose exec frontend-nodejs npm install

frontend-build:
	docker-compose exec frontend-nodejs npm run build