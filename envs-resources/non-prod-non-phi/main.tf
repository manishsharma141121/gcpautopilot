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

module "google_sql_database_instance" {
  source            = "../modules/cloud-sql"
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  instance_name     =var.instance_name
}
 
module "google_secret_manager_secret" {
  source            = "../modules/cloud-sql"
  for_each          = var.SecretID #local terrafrom variable
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1" 
}
module "google_sql_user" {
  source            = "../modules/cloud-sql"
  for_each          = var.user_name
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
}
module "google_sql_database" {
  source            = "../modules/cloud-sql"
  for_each          = var.databases
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
}

module "namespace" {
  source                 = "../modules/namespaces"
  namespaces             = var.namespaces
  ingress_service_name   = var.ingress_service_name
  ingress_service_port   = var.ingress_service_port
  internal_cidrs         = var.internal_cidrs
  allowed_cidrs          = var.allowed_cidrs
}