variable "project" {
    type = string
    description = "Name of project ID"
}
variable "vpc_name" {
  description = "value"
}

variable "subnet_name" {
  type = list(map(string))
  description = "value"
}
variable "region" {
    type = string
    description = "Name of the region for deployment"
}
variable "psc_target_service" {
    type = string
    description = "Name of the service to connect to"
}
