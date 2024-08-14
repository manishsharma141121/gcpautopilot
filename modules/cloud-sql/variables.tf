variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC where the PSC endpoint will be created"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet where the PSC endpoint will be created"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1"
}

variable "psc_target_service" {
  description = "The target service for PSC, such as a Google API or managed service"
  type        = string
}

variable "db_password" {
  type = string
  description = "database password"
}

#Variable

variable "db_instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
}

variable "databases" {
  type = string
  description = "Set of database to create within each cloud sql instance"
}

variable "db_master_username" {
  description = "Master username for the database"
  type        = string
  default     = "masteruser"
}

variable "db_master_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "db_master_secret_version" {
  type = string
}

variable "namespaces" {
  type = map(string)
  description = "Name of cluster namespace"
}

