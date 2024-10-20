create_dirs:
	@echo "\e[36mCreating the volumes (dirs) at $(HOME)/data\e[0m"
	@mkdir -p $(HOME)/data/mariadb
	@mkdir -p $(HOME)/data/wordpress

build: create_dirs
	docker-compose -f srcs/docker-compose.yml build

up: create_dirs
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans

start:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

re: down fclean build up

clean: down
	docker system prune -a

fclean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans
	docker system prune -f
	docker volume prune -f
	docker network prune -f
	sudo rm -rf $(HOME)/data

.PHONY: create_dirs build up down start stop re clean fclean