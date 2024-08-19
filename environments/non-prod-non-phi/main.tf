terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.40.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
# Terraform GCP Cloud SQL Module. This Terraform module creates a Cloud SQL instance on Google Cloud Platform.

module "cloud_sql" {
  source            = "../modules/cloud-sql"
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  instance_name     = var.instance_name
  database_version  = var.database_version
  instance_tier     = var.instance_tier
  databases         =var.databases
  users             =var.db_users
}

module "namespace" {
  source                 = "../modules/namespaces"
  namespaces             = var.namespaces
  ingress_service_name   = var.ingress_service_name
  ingress_service_port   = var.ingress_service_port
  internal_cidrs         = var.internal_cidrs
  allowed_cidrs          = var.allowed_cidrs
}