# Docker
restart:
	sudo systemctl restart docker

start:
	sudo docker start $(c)

stop:
	sudo docker stop $(c)

ps:
	sudo docker ps

# Imágenes de la aplicación web
build-dev:
	sudo docker build --no-cache -f dockerfile/dev_Dockerfile -t app:dev .

build-prod:
	sudo docker build --no-cache -f dockerfile/prod_Dockerfile -t app:prod .

# Terraform - Entorno de producción
TERRAFORM_PROD_DIR = prod

init-prod:
	cd $(TERRAFORM_PROD_DIR) && sudo terraform init

plan-prod:
	cd $(TERRAFORM_PROD_DIR) && sudo terraform plan -var-file=prod.tfvars

apply-prod:
	cd $(TERRAFORM_PROD_DIR) && sudo terraform apply -var-file=prod.tfvars

down-prod:
	cd $(TERRAFORM_PROD_DIR) && sudo terraform destroy -var-file=prod.tfvars


restart-prod:
	@echo "Reiniciando entorno de producción (destroy + apply)..."
	cd $(TERRAFORM_PROD_DIR) && sudo terraform destroy -var-file=prod.tfvars
	sudo docker build --no-cache -f dockerfile/prod_Dockerfile -t app:prod .
	cd $(TERRAFORM_PROD_DIR) && sudo terraform init && sudo terraform apply -var-file=prod.tfvars

clean-prod:
	cd $(TERRAFORM_PROD_DIR) && sudo terraform destroy -var-file=prod.tfvars
	sudo docker system prune -f

# Terraform - Entorno de desarrollo
TERRAFORM_DEV_DIR = dev

init-dev:
	cd $(TERRAFORM_DEV_DIR) && sudo terraform init

plan-dev:
	cd $(TERRAFORM_DEV_DIR) && sudo terraform plan -var-file=dev.tfvars

apply-dev:
	cd $(TERRAFORM_DEV_DIR) && sudo terraform apply -var-file=dev.tfvars

down-dev:
	cd $(TERRAFORM_DEV_DIR) && sudo terraform destroy -var-file=dev.tfvars

restart-dev:
	@echo "Reiniciando entorno de desarrollo (destroy + apply)..."
	cd $(TERRAFORM_DEV_DIR) && sudo terraform destroy -var-file=dev.tfvars -auto-approve
	sudo docker build --no-cache -f dockerfile/dev_Dockerfile -t app:dev .
	cd $(TERRAFORM_DEV_DIR) && sudo terraform init && sudo terraform apply -var-file=dev.tfvars

clean-dev:
	cd $(TERRAFORM_DEV_DIR) && sudo terraform destroy -var-file=dev.tfvars -auto-approve
	sudo docker system prune -f

help:
	@echo ""
	@echo "Comandos disponibles:"
	@echo "  make restart                       - Reinicia el servicio de Docker"
	@echo "  make start c=CONTAINER_ID          - Inicia un contenedor especificado"
	@echo "  make stop c=CONTAINER_ID           - Para un contenedor especificado"
	@echo "  make ps                            - Muestra todos los contenedores en ejecución"
	@echo ""
	@echo "  make build-dev                     - Construye la imagen de desarrollo (app:dev)"
	@echo "  make build-prod                    - Construye la imagen de producción (app:prod)"
	@echo ""
	@echo "  make init-dev                      - Inicializa el entorno de desarrollo"
	@echo "  make plan-dev                      - Muestra el plan de ejecución para dev"
	@echo "  make apply-dev                     - Aplica la configuración para dev"
	@echo "  make down-dev                      - Destruye el entorno de desarrollo"
	@echo "  make restart-dev                   - Recrea completamente el entorno dev"
	@echo "  make clean-dev                     - Destruye dev y limpia recursos Docker"
	@echo ""
	@echo "  make init-prod                     - Inicializa el entorno de producción"
	@echo "  make plan-prod                     - Muestra el plan de ejecución para prod"
	@echo "  make apply-prod                    - Aplica la configuración para prod"
	@echo "  make down-prod                     - Destruye el entorno de producción"
	@echo "  make restart-prod                  - Recrea completamente el entorno prod"
	@echo "  make clean-prod                    - Destruye prod y limpia recursos Docker"
	@echo ""