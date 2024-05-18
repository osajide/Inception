
all:
	@mkdir -p /home/osajide/data/website/ /home/osajide/data/mysql/
	@docker compose -f srcs/docker-compose.yml up -d --build

start:
	@docker compose -f srcs/docker-compose.yml up -d

stop:
	@docker compose -f srcs/docker-compose.yml down

clean:
	@docker compose -f srcs/docker-compose.yml down
	@docker system prune
	@sudo rm -rf /home/osajide/data/website/*
	@sudo rm -rf /home/osajide/data/mysql/*

fclean:
	@docker compose -f srcs/docker-compose.yml down -v
	@docker system prune -af
	@sudo rm -rf /home/osajide/data/*

rebuild:
	@docker compose  -f srcs/docker-compose.yml down -v
	@sudo rm -rf /home/osajide/data/website/*
	@sudo rm -rf /home/osajide/data/mysql/*
	@docker compose -f srcs/docker-compose.yml up -d --build

re: fclean all

.PHONY: all start stop clean fclean rebuild re