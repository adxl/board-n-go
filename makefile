start:
	docker compose -p default up -d
	docker compose -p auth_api -f api-auth/docker-compose.yaml up -d
	docker compose -p events_api -f api-events/docker-compose.yaml up -d
	docker compose -p gears_api -f api-gears/docker-compose.yaml up -d
	docker compose -p exams_api -f api-exams/docker-compose.yaml up -d

stop:
	docker compose -p auth_api -f api-auth/docker-compose.yaml down
	docker compose -p events_api -f api-events/docker-compose.yaml down
	docker compose -p gears_api -f api-gears/docker-compose.yaml down
	docker compose -p exams_api -f api-exams/docker-compose.yaml down
	docker compose -p default down

restart:
	make stop && make start
