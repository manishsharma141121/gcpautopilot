output "network_name" {
  value = module.vpc.network_name
}

output "subent_name" {
  value = [for network in module.subnets.subnets : network.name]
  description = "names of subnets created"
}

