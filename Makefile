TERRAFORM = docker-compose run --rm terraform
AWS_DEFAULT_REGION := ap-northeast-1
AWS_PROFILE := localstack

up:
	docker-compose up localstack

init:
	$(TERRAFORM) init

plan: terraform/init terraform/fmt
	$(TERRAFORM) plan -parallelism=1000

apply: terraform/init terraform/fmt
	$(TERRAFORM) apply -auto-approve=false -parallelism=1000

fmt:
	$(TERRAFORM) fmt

shell:
	docker-compose run --rm --entrypoint /bin/ash terraform
