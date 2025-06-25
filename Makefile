# Include Environment Variables
include .env

# -------------------------------------------------------------------
# 🐳 Docker Project Management
# -------------------------------------------------------------------

project_start:      ## 🚀 Starts the Project
	docker compose up -d

project_stop:       ## 🛑 Stops the Project
	docker compose stop

project_destroy:    ## 💣 Deletes the Project and its volumes
	docker compose down -v

# -------------------------------------------------------------------
# 🛠️  Development Utilities
# -------------------------------------------------------------------

express_deploy:		## 🔧 Opens a shell in the CodeIgniter container
	docker exec -it -u root ${PROJECT_NAME}-express /bin/bash