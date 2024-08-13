variable "project_id" {
    description = "The ID where the VPC will be created "
}

variable "network_name" {
  description = "Name of the network being created"
}

variable "routing_mode" {
  type = string
  default = "GLOBAL"
  description = "Network Routing mode (default 'GLOBAL')"
}

variable "shared-vpc_host" {
    type = bool
    description = "optional resource of this resource"
}

variable "description" {
  type = string
  description = "description of resource"
}

variable "auto_create_subnetworks" {
  type = bool
  description = ""
}


