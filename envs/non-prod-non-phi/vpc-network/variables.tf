variable "project_id" {
  description = ""
}

variable "region" {
  description = "value"
}

variable "vpc_name" {
  description = "value"
}

variable "subnets" {
  type = list(map(string))
  description = "value"
}

variable "routing_mode" {
  type = string
  default = "GLOBAL"
  description = "value"
}

variable "description" {
  description = "value"
  default = "This VPC network will be used for prod project"
}
