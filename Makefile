build:
	docker build --no-cache -t ogprogrammer/xdebug .

down:
	docker-compose down

logs:
	docker-compose logs -f

push:
	docker push ogprogrammer/xdebug

ssh:
	docker exec -it dockerxdebug_example_app_1 bash

up:
	docker-compose up -d --force-recreate