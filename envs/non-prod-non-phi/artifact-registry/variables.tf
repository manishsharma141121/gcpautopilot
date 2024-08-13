variable "region" {
    type = string
    description = "Name of the region for deployment"
}

variable "repo" {
  type = string
  description = "Name of the Repositroy for Deployment"
}

variable "format" {
  type = string
  description = "Name of the format for deployment"
}

variable "project" {
    type = string
    description = "Name of project ID"
}

variable "labels" {
  description = "A set of key:value pair"
  type = map(string)
  default = null
}

variable "description" {
  description = "A set of key:value lable pair for artifact registary"
  type = string
  default = "For Docker Images"
}