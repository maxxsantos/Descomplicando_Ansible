
host_init_configs = "./configs_local/hosts"
main_init_configs = "./configs_local/main.yml"

host_provisioning = "./provisioning/hosts"
main_provisioning = "./provisioning/main.yml"

host_install_k8s = "./install_k8s/hosts"
main_install_k8s = "./install_k8s/main.yml"

host_deploy_app_v1 = "./deploy-app-v1/hosts"
main_deploy_app_v1 = "./deploy-app-v1/main.yml"

host_deploy_app_v2 = "./deploy-app-v2/hosts"
main_deploy_app_v2 = "./deploy-app-v2/main.yml"


define execute_ansible_playbook
	ansible-playbook -i $1 $2 $3
endef

init-configs:
	$(call execute_ansible_playbook,$(host_init_configs),$(main_init_configs),$(plus)) --ask-become-pass 
  
prov:
	$(call execute_ansible_playbook,$(host_provisioning),$(main_provisioning),$(plus))

k8s:
	$(call execute_ansible_playbook,$(host_install_k8s),$(main_install_k8s),$(plus))

deploy-v1:
	$(call execute_ansible_playbook,$(host_deploy_app_v1),$(main_deploy_app_v1),$(plus))

deploy-v2:
	$(call execute_ansible_playbook,$(host_deploy_app_v2),$(main_deploy_app_v2),$(plus))

all:
	$(call execute_ansible_playbook,$(host_init_configs),$(main_init_configs),$(plus)) --ask-become-pass 
	$(call execute_ansible_playbook,$(host_provisioning),$(main_provisioning),$(plus))
	$(call execute_ansible_playbook,$(host_install_k8s),$(main_install_k8s),$(plus))
	$(call execute_ansible_playbook,$(host_deploy_app_v1),$(main_deploy_app_v1),$(plus))