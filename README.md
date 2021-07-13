# DevOps

# Azure
<a href="https:/​/​portal.​azure.​com">Azure Portal</a>

## Creating Service Principal
```bash
az ad sp create-for-rbac --name="<ServicePrincipal name>" -- role="Contributor" --scopes="/subscriptions/<subscription Id>"
```

# <a href="terraform/README.md">Terraform</a>


# Github

```bash
echo "# devops" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:paulokinjo/devops.git
git push -u origin main
```