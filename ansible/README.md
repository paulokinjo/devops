# Ansible

# Creating the Environment

## Building the base image
```bash
docker build -t ssh-ubuntu -f Dockerfile .
```

## Creating the network
```bash
docker network create ansible-net
```

## Creating the servers
```bash
docker container run -v $(pwd):/root -d --net ansible-net --name ansible-control ssh-ubuntu
docker container run -d --net ansible-net --name webserver1 ssh-ubuntu
docker container run -d --net ansible-net --name webserver2 ssh-ubuntu
docker container run -d --net ansible-net --name database1 ssh-ubuntu
docker container run -d --net ansible-net --name database2 ssh-ubuntu
```
## Accessing the Ansible control server
```bash
docker container exec -it ansible-control bash
```

### Enabling the SSH access with all related servers
```bash
export PASSWORD=root
export USER=root

sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no $USER@webserver1 "hostname"
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no $USER@webserver2 "hostname"
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no $USER@database1 "hostname"
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no $USER@database2 "hostname"
```

### Installing Ansible
```bash
 apt-get update
 apt-get install software-properties-common -y
 apt-add-repository --yes --update ppa:ansible/ansible
 apt-get install ansible -y
```

### Testing the installation
```bash
ansible -i inventory webserver -u root -m ping
```

# Playbook
```bash
 ansible-playbook -i inventory playbook.yaml
```

## Dry run
```bash
ansible-playbook -i inventory playbook.yaml --check
```

# Vault
```bash
ansible-vault encrypt group_vars/database/main.yaml
```
Sample Password: senha123
```bash
ansible-vault decrypt group_vars/database/main.yaml
```

## Best Practice
```bash
ansible-vault encrypt group_vars/database/main.yml --vault-password-file .vault_pass.txt
```

Executing
```bash
ansible-playbook -i inventory playbook.yaml --ask-vault-pass
```

CI/CD
```bash
ansible-playbook -i inventory playbook.yaml --vault-password-file .vault_pass.txt
```

# Creating Service Principal
```bash
az ad sp create-for-rbac --name="<ServicePrincipal name>" --role="Contributor" --scopes="/subscriptions/<subscription Id>"
```

export AZURE_SUBSCRIPTION_ID=<subscription_id>
export AZURE_CLIENT_ID=<client ID>
export AZURE_SECRET=<client Secret>
export AZURE_TENANT=<tenant ID>

# Requirements
Install the Python Azure SDK on the machine that runs Ansible with the ```pip install azure``` command.

```bash
apt install -y python-pip
pip install 'azure==2.0.0rc5' --upgrade
```

# Running

```bash
ansible-inventory -i inventories/azure_rm.py --list
ansible-inventory -i inventories/azure_rm.py --list | grep public_ip

ansible-playbook -i inventories/ playbook.yaml --vault-password-file .vault_pass.txt --extra-vars "ansible_user=devopsdmin ansible_password=devopsdmin123*"
```