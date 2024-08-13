variable "project_id" {
    type = string
    description = "The ID where the VPC will be created "
}

variable "network_name" {
    type = string
  description = "Name of the network being created"
}

variable "subnets" {
    type = list(map(string))
    description = "The list of string being created"
    default = []
}

variable "secondary_ranges" {
  type = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary Ranges that woll be used in some of the subnets"
  default = {}
}

