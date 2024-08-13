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
