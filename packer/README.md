# Packer

## Environments Configuration
> export ARM_SUBSCRIPTION_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

> export ARM_CLIENT_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

> export ARM_CLIENT_SECRET=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

> export ARM_TENANT_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

# Executing
```bash
packer validate azure_linux.json
```

```bash
packer build azure_linux.json
```