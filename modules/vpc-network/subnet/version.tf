terraform {
  required_version = ">=1.2.3"
  
  required_providers {
    google = {
        source = "hashicorp/google"
        version = ">= 2.12"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-goolge-network:subnets/v5.1.0"
  }
}