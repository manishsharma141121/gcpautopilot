#This setup will create a Cloud SQL instance, databases with the master username and password stored securely in GCP Secret Manager.
#Create Cloud Sql Instance for each namespace
#Create the Secret in GCP Secret Manager
#Create the Cloud SQL Instance

resource "google_sql_database_instance" "instance_name" {
  for_each = kubernetes_namespace.namespace
  # metadata {
  #   name      = "${each.value.metadata[0].name}-sql-instance"
  #   namespace = each.value.metadata[0].name
  # }
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
  # metadata {
  #   name      = "${each.value.metadata[0].name}-sql-database"
  #   namespace = each.value.metadata[0].name
  # }
  name = var.databases
  instance = google_sql_database_instance.instance_name
  
}

resource "google_sql_user" "db_master_user" {
  for_each = kubernetes_namespace.namespace
  name     = var.db_master_username
  instance = google_sql_database_instance.instance_name.name
  password = var.db_master_password
}

resource "random_password" "db_password" {
  length = 16
  special = true
}

resource "google_secret_manager_secret" "db_master_secret" {
  for_each = kubernetes_namespace.namespace
  secret_id = var.db_master_password
  replication {
    #automatic = true
  }
}

resource "google_secret_manager_secret_version" "db_master_secret_version" {
  for_each = kubernetes_namespace.namespace
  secret      = var.db_master_secret_version
  secret_data = var.db_master_password
}



