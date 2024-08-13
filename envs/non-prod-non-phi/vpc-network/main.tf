##vpc creation

module "vpc" {
  source = "../../../modules/vpc-network/vpc"
  project_id = var.project_id
  network_name = var.vpc_name
  routing_mode = var.routing_mode
  description = var.description
  shared-vpc_host = false
  auto_create_subnetworks = false
}

## subnet configuration

module "subnets" {
  source = "../../../modules/vpc-network/subnet"
  project_id = var.project_id
  network_name = module.vpc.network_name
  subnets = var.subnets
}