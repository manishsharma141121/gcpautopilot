#This setup will create a Cloud SQL instance with the master username and password stored securely in GCP Secret Manager.
#Create Cloud Sql Instance for each namespace and each Database and store secrets respectively
#Create the Secret in GCP Secret Manager

resource "google_secret_manager_secret" "db_master_secret" {
  secret_id = var.db_master_password
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "db_master_secret_version" {
  secret      = var.db_master_secret_version
  secret_data = var.db_master_password
}

#Create the Cloud SQL Instance

resource "google_sql_database_instance" "instance_name" {
  name = var.db_instance_name
  database_version = "MYSQL_8_0"
  region           = var.gcp_region

  settings {
    tier = each.value.tier
    backup_configuration {
      enabled = true
    }
  }
}

resource "google_sql_user" "db_master_user" {
  name     = var.db_master_username
  instance = google_sql_database_instance.instance_name.name
  password = var.db_master_password
}



