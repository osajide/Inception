
all:
	@docker compose -f srcs/docker-compose.yml up -d

start:
	@docker compose -f srcs/docker-compose.yml up -d

stop:
	@docker compose -f srcs/docker-compose.yml down

clean:
	@docker compose -f srcs/docker-compose.yml down

fclean:
	@docker compose -f srcs/docker-compose.yml down -v

restart:	clean all

reset:	fclean
	@docker compose -f srcs/docker-compose.yml up -d --build

.PHONY: all start stop clean fclean restart reset
