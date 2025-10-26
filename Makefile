DOCKER-COMPOSE := docker compose
USER := tdausque
COMPOSE_FILE = srcs/docker-compose.yml

export COMPOSE_FILE

up:
	@if [ ! -d /home/$(USER)/data/mariadb ] || [ ! -d /home/$(USER)/data/wordpress ]; then \
		mkdir -p /home/$(USER)/data/mariadb; \
		mkdir -p /home/$(USER)/data/wordpress; \
	fi
	$(DOCKER-COMPOSE) up --build
down:
	$(DOCKER-COMPOSE) down -v

clean:
	$(DOCKER-COMPOSE) down --rmi all
	@sudo rm -rf /home/$(USER)/data/

re: clean build up


.PHONY: up build down clean
