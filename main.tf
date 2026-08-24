terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  description = "Environment name embedded in the generated configuration."
  type        = string
  default     = "dev"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.environment))
    error_message = "environment must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "app_name" {
  description = "Application name used in the managed configuration."
  type        = string
  default     = "sample-app"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.app_name))
    error_message = "app_name must contain only lowercase letters, numbers, and hyphens."
  }
}

locals {
  config = <<-EOT
    app_name=${var.app_name}
    environment=${var.environment}
    managed_by=terraform
  EOT
}

resource "local_file" "app_config" {
  filename        = "${path.module}/generated/${var.app_name}-${var.environment}.conf"
  content         = local.config
  file_permission = "0644"
}

output "managed_config_path" {
  description = "Path of the configuration file managed by Terraform."
  value       = local_file.app_config.filename
}

output "environment" {
  description = "Selected deployment environment."
  value       = var.environment
}
