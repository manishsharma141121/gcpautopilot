#This setup will create a Cloud SQL instance, databases with the master username and password stored securely in GCP Secret Manager.
#Create Cloud Sql Instance for each namespace
#Create the Secret in GCP Secret Manager
#Create the Cloud SQL Instance

resource "google_sql_database_instance" "instance_name" {
    for_each = kubernetes_namespace.namespace
    name = var.db_instance_name
    database_version = var.database_version
    region           = var.gcp_region

  settings {
    tier = each.value.tier
    backup_configuration {
      enabled = true
    }
  }
}
#Create database using for_each
resource "google_sql_database" "databases" {
  for_each = kubernetes_namespace.namespace
  name = var.databases
  instance = google_sql_database_instance.instance_name.name
  
}

resource "google_sql_user" "db_master_user" {
  for_each = kubernetes_namespace.namespace
  name     = var.db_master_username
  instance = google_sql_database_instance.instance_name.name
  password = var.db_master_username.pass
}

# Create a random password for the CloudSQL master user
resource "random_password" "db_password" {
  length = 16
  special = true
}

# Create a secret in Google Secret Manager to store the master user password
resource "google_secret_manager_secret" "db_password_secret" {
  for_each = kubernetes_namespace.namespace
  secret_id = "${var.name_prefix}-db-password"
  replication {
    # automatic = true
  }
}

# Store the generated password in the secret
resource "google_secret_manager_secret_version" "db_password_secret_version" {
  provider = google

  secret      = google_secret_manager_secret.db_password_secret.id
  secret_data = random_password.db_password.result
}

# Retrieve the secret value from Google Secret Manager
data "google_secret_manager_secret_version" "db_password" {
  provider = google

  secret = google_secret_manager_secret.db_password_secret.id
  version = "latest"
}

# CREATE A RANDOM SUFFIX AND PREPARE RESOURCE NAMES
resource "random_id" "name" {
  byte_length = 2
}

locals {
  # If name_override is specified, use that - otherwise use the name_prefix with a random string
  instance_name = var.name_override == null ? format("%s-%s", var.name_prefix, random_id.name.hex) : var.name_override
}



