
all:
	@docker compose -f srcs/docker-compose.yml up -d

build:
	@docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker compose -f srcs/docker-compose.yml down

fclean:
	@docker compose -f srcs/docker-compose.yml down -v

restart:	clean all

reset:	fclean build

.PHONY: all build clean fclean restart reset
