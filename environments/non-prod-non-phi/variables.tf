variable "project_id" {
  description = "The project ID to deploy the GKE cluster"
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be deployed"
  type        = string
}

variable "instance_name" {
  description = "The name of the SQL Instance created"
  type        = string
}

variable "instance_tier" {
  description = "The tier(machine type) of Instance created"
  type        = string
}

variable "availability_type" {
  description = "The availability type of the SQL Instance created(Zonal, regional)"
  type        = string
}

variable "ipv4_enabled" {
  description = "whether the instance should be assigned public IP address"
  type        = bool
  default = true
}

variable "require_ssl" {
  description = "whether SSL connections are required"
  type        = bool
  default = false
}

variable "databases" {
  description = "A list of databases to create in the instance"
  type        = string
}

variable "db_users" {
  description = "A list of users for database) "
  type        = string
}
variable "master_user_password" {
  description = "The password for the master user of the database."
  type        = string
}

variable "secret_manager_secret_name" {
  description = "The name of the secret manager secret to store password"
  type        = string
}

variable "namespaces" {
  description = "A list of namespaces to create in the Kubernetes cluster"
  type        = list(string)
}

variable "ingress_service_name" {
  description = "The name of the service to be used in the ingress configuration"
  type        = string
}

variable "ingress_service_port" {
  description = "The port of the service to be used in the ingress configuration"
  type        = number
}

variable "internal_cidrs" {
  description = "List of internal CIDRs for network policies"
  type        = list(string)
}

variable "allowed_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/8", "192.168.0.0/16"]  # Example CIDRs
}
