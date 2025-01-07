infra:
	terraform init
	terraform apply -auto-approve

#ansible:
#		ansible-playbook -i $(tool_name)-internal.devops11.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name) -e vault_token=$(vault_token) main.yml

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
