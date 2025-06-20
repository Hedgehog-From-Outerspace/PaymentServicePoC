# Makefile for managing Docker Swarm stack management

STACK_NAME=paymentsystem
COMPOSE_FILE=docker-stack.yml

# Deploy or update the stack
deploy:
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

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

# Rebuild images and redeploy
rebuild:
	docker build -t paymentservice:latest -f PaymentService/Dockerfile .
	docker build -t tokenservice:latest -f TokenService/Dockerfile .
	docker build -t transactionlogservice:latest -f TransactionLogService/Dockerfile .
	docker build -t walletservice:latest -f WalletService/Dockerfile .
	docker stack deploy -c $(COMPOSE_FILE) $(STACK_NAME)

help:
	@echo "Usage:"
	@echo "  make deploy       - Deploy stack to Swarm"
	@echo "  make remove       - Remove the stack"
	@echo "  make services     - List services in the stack"
	@echo "  make ps           - List running containers/tasks"
	@echo "  make logs         - Show logs for all services"
	@echo "  make rebuild      - Rebuild images and redeploy stack"