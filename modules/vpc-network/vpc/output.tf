output "network" {
  value = google_compute_network.vpc_network
  description = "Name of reource being created"
}

output "network_name" {
  value = google_compute_network.vpc_network.name
  description = "Name of the VPC"
}

output "network_self_link" {
  value = google_compute_network.vpc_network.self_link
}
