output "db_master_secret_name" {
  value       = google_secret_manager_secret.db_master_secret.secret_id
  description = "Name of the secret storing the DB master credentials"
}