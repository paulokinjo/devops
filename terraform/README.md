# Terraform

## Environments Configuration
> export ARM_SUBSCRIPTION_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

> export ARM_CLIENT_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

> export ARM_CLIENT_SECRET=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

> export ARM_TENANT_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

#### 1-Create resource group
```bash
az group create --name MyRgRemoteBackend --location westeurope
```
#### 2-Create storage account
```bash
az storage account create --resource-group MyRgRemoteBackend --name kinstorageremotetf --sku Standard_LRS --encryption-services blob
```
##### 3-Get storage account key
```bash
export ARM_ACCESS_KEY=$(az storage account keys list --resource-group MyRgRemoteBackend --account-name kinstorageremotetf --query [0].value -o tsv)
```
##### 4-Create blob container
```bash
az storage container create --name tfbackends --account-name kinstorageremotetf --account-key $ARM_ACCESS_KEY
```

## CI/CD Pipeline
1. Retrieving the code from the SCM
2. Code formatting with terraform fmt
3. Initialization with terraform init
4. Code validation with terraform validate
5. Display a preview of the infrastructure changes with terraform plan -out=out.tfplan
6. Application of changes in automatic mode with terraform apply --auto-approve out.tfplan
