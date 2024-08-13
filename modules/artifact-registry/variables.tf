variable "region_name" {
    type = string
    description = "Name of the region for deployment"
}

variable "repo_id" {
  type = string
  description = "Name of the Repositroy for Deployment"
}

variable "format_type" {
  type = string
  description = "Name of the format for deployment"
}

variable "project_id" {
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