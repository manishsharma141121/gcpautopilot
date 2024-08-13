output "psc_endpoint_ip" {
  value = google_compute_forwarding_rule.psc_endpoint.network
}

output "psc_endpoint_name" {
  value = google_compute_forwarding_rule.psc_endpoint.name
}
output "db_master_secret_name" {
  value       = google_secret_manager_secret.db_master_secret.secret_id
  description = "Name of the secret storing the DB master credentials"
}