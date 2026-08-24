# Project 09 — Terraform Infrastructure as Code Fundamentals

A self-contained Terraform lab that demonstrates the core Infrastructure as Code workflow without requiring an AWS, Azure, or GCP account.

## What it demonstrates

- Terraform configuration and version constraints
- Provider requirements
- Input variables and validation
- Local values
- Declarative resource management
- Generated configuration as managed infrastructure state
- Terraform outputs
- `init`, `fmt`, `validate`, `plan`, and `apply`
- Safe state-file handling with `.gitignore`

## Project structure

```text
.
├── main.tf
├── terraform.tfvars.example
├── README.md
├── docs/
│   └── USAGE.md
├── tests/
│   └── test_structure.sh
└── .github/
    └── workflows/
        └── terraform.yml
```

## Quick start

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan -var-file=terraform.tfvars.example
terraform apply -var-file=terraform.tfvars.example
```

After `apply`, Terraform creates `generated/sample-app-dev.conf` and exposes its path through the `managed_config_path` output.

To remove the managed file:

```bash
terraform destroy -var-file=terraform.tfvars.example
```

No cloud resources are created by this project.
