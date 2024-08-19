output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  value       = google_sql_database_instance.default.connection_name
}

output "instance_self_link" {
  description = "The self-link of the Cloud SQL instance."
  value       = google_sql_database_instance.instance_name.self_link
}

output "databases" {
  description = "The names of the created databases."
  value       = google_sql_database.databases.name
}

output "users" {
  description = "The names of the created users."
  value       = google_sql_user.users.name
}