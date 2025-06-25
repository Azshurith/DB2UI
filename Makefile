# --------------------------------------------------
# 🌍 Load Environment Variables
# --------------------------------------------------
include .env

# --------------------------------------------------
# 🐳 Project Lifecycle Commands
# --------------------------------------------------

project_start:         ## 🚀 Start all containers in detached mode
	docker compose up -d

project_stop:          ## 🛑 Stop all running containers
	docker compose stop

project_restart:       ## 🔄 Restart all containers
	docker compose restart

project_destroy:       ## 💣 Remove containers and volumes
	docker compose down -v

# --------------------------------------------------
# 🧠 Express Backend Commands
# --------------------------------------------------

express_shell:         ## 🔧 Open a shell in Express container
	docker exec -it -u root ${PROJECT_NAME}-express /bin/bash

express_install:       ## 📦 Install backend dependencies
	docker exec -it -u root ${PROJECT_NAME}-express npm install

express_update:        ## 🔄 Update backend packages
	docker exec -it -u root ${PROJECT_NAME}-express npm update

express_dev:           ## 🛠️ Run Express in dev mode
	docker exec -it -u root ${PROJECT_NAME}-express sh -c "npm run dev"

express_start:         ## ▶️ Run Express in production mode
	docker exec -it -u root ${PROJECT_NAME}-express sh -c "npm run start"

express_build:         ## 🔧 Build backend (if applicable)
	docker exec -it -u root ${PROJECT_NAME}-express sh -c "npm run build"

# --------------------------------------------------
# 🖥️ Nuxt Frontend Commands
# --------------------------------------------------

nuxt_shell:            ## 🔧 Open a shell in Nuxt container
	docker exec -it -u root ${PROJECT_NAME}-nuxt /bin/bash

nuxt_install:          ## 📦 Install frontend dependencies
	docker exec -it -u root ${PROJECT_NAME}-nuxt npm install

nuxt_update:           ## 🔄 Update frontend packages
	docker exec -it -u root ${PROJECT_NAME}-nuxt npm update

nuxt_dev:              ## 🛠️ Run Nuxt in dev mode
	docker exec -it -u root ${PROJECT_NAME}-nuxt sh -c "npm run dev"

nuxt_start:            ## ▶️ Run Nuxt in production mode
	docker exec -it -u root ${PROJECT_NAME}-nuxt sh -c "npm run start"

nuxt_build:            ## 🔧 Build frontend for production
	docker exec -it -u root ${PROJECT_NAME}-nuxt sh -c "npm run build"

# --------------------------------------------------
# 📖 Help
# --------------------------------------------------
help:  ## 📖 Show this help menu
	@echo "╔══════════════════════════════════════════════════════════════════════════════╗"
	@echo "║                          🛠️  Make Commands Help                               ║"
	@echo "╠══════════════════════════════════════════════════════════════════════════════╣"
	@awk -F':.*?## ' '/^[a-zA-Z0-9_-]+:.*?## / { printf "║ 	\033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo "╚══════════════════════════════════════════════════════════════════════════════╝"