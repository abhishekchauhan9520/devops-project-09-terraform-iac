# Usage Guide

## 1. Initialize

```bash
terraform init
```

Terraform downloads the pinned provider and prepares the working directory.

## 2. Format and validate

```bash
terraform fmt -check
terraform validate
```

Formatting keeps the configuration consistent; validation catches structural and type errors before planning.

## 3. Review the plan

```bash
terraform plan -var-file=terraform.tfvars.example
```

The plan should show one `local_file.app_config` resource to be created.

## 4. Apply

```bash
terraform apply -var-file=terraform.tfvars.example
```

Terraform creates the generated configuration file from the declared configuration.

## 5. Inspect outputs

```bash
terraform output
```

## 6. Destroy

```bash
terraform destroy -var-file=terraform.tfvars.example
```

This removes the managed file and leaves the working tree clean apart from Terraform's local state directory/files.
