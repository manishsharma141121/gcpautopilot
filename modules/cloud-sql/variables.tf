variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-central1"
}

variable "db_password" {
  type = string
  description = "database password"
}

variable "database_version" {
  type=string
  description = "The version of the database created"
  
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

variable "name_prefix" {
  description = "Prefix to use for resource names. A random suffix will be appended."
  type        = string
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

variable "name_override" {
  description = "Override the generated name with a custom name. If null, the generated name will be used."
  type        = string
  default     = null
}

