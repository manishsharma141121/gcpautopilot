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

variable "instance_name" {
  type = map(string)
  default = {
    instance1= {
      name = string
    }
    instance2 = {
      name = string
    }
    instance3 = {
      name = string
    }
  }
}

variable "namespaces" {
  type = map(string)
  default = {
    namespace1= {
      name = string
    }
    namespace2 = {
      name = string
    }
    namespace3 = {
      name = string
    }
  }
}