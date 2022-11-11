TERRAFORM = docker-compose run --rm terraform
AWS_DEFAULT_REGION := ap-northeast-1
AWS_PROFILE := localstack

terraform/init:
	$(TERRAFORM) init

terraform/plan: terraform/init terraform/fmt
	$(TERRAFORM) plan -parallelism=1000

terraform/apply: terraform/init terraform/fmt
	$(TERRAFORM) apply -auto-approve=false -parallelism=1000

terraform/fmt:
	$(TERRAFORM) fmt
