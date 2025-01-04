infra:
	terraform init
	terraform apply -auto-approve

#dev-apply:
#	rm -rf .terraform
#	terraform init -backend-config=env-dev/state.tfvars
#	terraform apply -auto-approve -var-file=env-dev/main.tfvars
#
#dev-destroy:
#	rm -rf .terraform
#	terraform init -backend-config=env-dev/state.tfvars
#	terraform destroy -auto-approve -var-file=env-dev/main.tfvars
#
#prod-apply:
#	rm -rf .terraform
#	terraform init -backend-config=env-prod/state.tfvars
#	terraform apply -auto-approve -var-file=env-prod/main.tfvars
#
#prod-destroy:
#	rm -rf .terraform
#	terraform init -backend-config=env-prod/state.tfvars
#	terraform destroy -auto-approve -var-file=env-prod/main.tfvars
#
