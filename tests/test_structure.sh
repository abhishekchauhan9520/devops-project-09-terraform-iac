#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

for required in main.tf terraform.tfvars.example README.md docs/USAGE.md .github/workflows/terraform.yml; do
  test -f "$ROOT_DIR/$required" || { echo "missing: $required" >&2; exit 1; }
done

grep -q 'required_providers' "$ROOT_DIR/main.tf"
grep -q 'variable "environment"' "$ROOT_DIR/main.tf"
grep -q 'resource "local_file" "app_config"' "$ROOT_DIR/main.tf"
grep -q 'output "managed_config_path"' "$ROOT_DIR/main.tf"
grep -q 'terraform validate' "$ROOT_DIR/.github/workflows/terraform.yml"
grep -q '.terraform/' "$ROOT_DIR/.gitignore"

echo 'Project 09 structure tests passed.'
