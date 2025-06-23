STACK_NAME=paymentsystem
COMPOSE_FILE=docker-stack.yml

# Build all services
rebuild:
	docker build -t paymentservice:latest -f PaymentService/Dockerfile .
	docker build -t tokenservice:latest -f TokenService/Dockerfile .
	docker build -t transactionlogservice:latest -f TransactionLogService/Dockerfile .
	docker build -t walletservice:latest -f WalletService/Dockerfile .

# Rebuild and deploy
update: rebuild deploy

# Deploy or update the stack
deploy:
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

# Force update all services (e.g. if image tag hasn't changed)
force-redeploy:
	docker service update --force $(STACK_NAME)_paymentservice
	docker service update --force $(STACK_NAME)_tokenservice
	docker service update --force $(STACK_NAME)_transactionlogservice
	docker service update --force $(STACK_NAME)_walletservice

# Remove the stack
remove:
	docker stack rm $(STACK_NAME)

# View stack services
services:
	docker stack services $(STACK_NAME)

# View running containers/tasks
ps:
	docker stack ps $(STACK_NAME)

# View logs from all services
logs:
	docker service logs $(STACK_NAME)_paymentservice
	docker service logs $(STACK_NAME)_tokenservice
	docker service logs $(STACK_NAME)_transactionlogservice
	docker service logs $(STACK_NAME)_walletservice

# Help overview
help:
	@echo "Usage:"
	@echo "  make update         - Build images and deploy updated stack"
	@echo "  make rebuild        - Only rebuild images"
	@echo "  make deploy         - Deploy or update the stack"
	@echo "  make force-redeploy - Force update all services"
	@echo "  make remove         - Remove the stack"
	@echo "  make services       - List services in the stack"
	@echo "  make ps             - List running containers/tasks"
	@echo "  make logs           - Show logs for all services"
