output "psc_endpoint_ip" {
  value = google_compute_forwarding_rule.psc_endpoint.network
}

output "psc_endpoint_name" {
  value = google_compute_forwarding_rule.psc_endpoint.name
}