TERRAFORM = docker-compose run --rm terraform
AWS_DEFAULT_REGION := ap-northeast-1
AWS_PROFILE := localstack

up:
	docker-compose up --build

init:
	$(TERRAFORM) init

plan: init fmt
	$(TERRAFORM) plan -parallelism=1000

apply:
	$(TERRAFORM) apply -auto-approve=false -parallelism=1000

fmt:
	$(TERRAFORM) fmt

shell:
	docker-compose run --rm --entrypoint /bin/ash terraform
