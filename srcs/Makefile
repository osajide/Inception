
all:
	@mkdir -p /home/osajide/data/website/ /home/osajide/data/mysql/
	@docker compose up -d --build

start:
	@docker compose up -d

stop:
	@docker compose down

clean:
	@docker compose down
	@docker system prune
	@sudo rm -rf /home/osajide/data/website/*
	@sudo rm -rf /home/osajide/data/mysql/*

fclean:
	@docker compose down -v
	@docker system prune -af
	@sudo rm -rf /home/osajide/data/*
	@docker volume rm srcs_db-vol
	@docker volume rm srcs_web-vol

re:
	@docker compose down
	@sudo rm -rf /home/osajide/data/website/*
	@sudo rm -rf /home/osajide/data/mysql/*
	@docker compose up -d --build