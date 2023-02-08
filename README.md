# Descomplicando_Ansible

Todos os comandos são executados com Makefile para facilitar a automação.

* `make init-configs`: Executa o playbook para instalação do python3, pip e do boto3 na máquina local (precisando da senha root para executar o playbook).
* `make prov`: Executa o playbook provisioning
* `make k8s`: Executa o playbook install_k8s
* `make deploy-v1`: Executa o playbook deploy-app-v1
* `make deploy-v2`: Executa o playbook deploy-app-v2
* `make play`: Executa os playbooks provisioning, install_k8s e deploy-app-v1
* `make all`: Executa todos os playbooks

É possível passar parâmetros para rodar esses playbook utilizando a flag `plus`.
Exemplo:

```bash
# Executa o playbook de provisionamento com a flag --list-tags
make prov plus="--list-tags"

# Executa o playbook de configurações iniciais com as flags --list-tags e --list-tasks
make init-configs plus="---list-tags ---list-tasks"

# Executa o playbook deploy-app-v1 sem flags
make deploy-v1

# Executa todos os playbooks com a flag -vvvv
make all plus="-vvvv"
```

Pode passar 1 ou mais parâmetros nessa na flag `plus`

O arquivo hosts dos playbooks `install_k8s`, `deploy-app-v1` e `deploy-app-v2` são editados com os IP's das instâncias no playbook de provisionamento. Então, não precisa ser editado manualmente mas caso queria repetir o comando de provisionamento será necessário voltar as modificações nesses arquivos.
