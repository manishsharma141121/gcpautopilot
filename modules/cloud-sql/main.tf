#This setup will create a Cloud SQL instance with the master username and password stored securely in GCP Secret Manager.
#Create the Secret in GCP Secret Manager

resource "google_secret_manager_secret" "db_master_secret" {
  secret_id = "db-master-credentials"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "db_master_secret_version" {
  secret      = google_secret_manager_secret.db_master_secret.id
  secret_data = var.db_master_password
}

#Create the Cloud SQL Instance

resource "google_sql_database_instance" "mydb" {
  name             = var.db_instance_name
  database_version = "MYSQL_8_0"
  region           = var.gcp_region

  settings {
    tier = "db-f1-micro"
    backup_configuration {
      enabled = true
    }
  }
}

resource "google_sql_user" "db_master_user" {
  name     = var.db_master_username
  instance = google_sql_database_instance.mydb.name
  password = var.db_master_password
}

# Enable the necessary APIs
resource "google_project_service" "private_service_connect" {
  project = "your-project-id"
  service = "servicenetworking.googleapis.com"
}

# module "private_service_connect" {
#   source                     = "terraform-google-modules/network/google//modules/private-service-connect"

#   project_id                 = "<PROJECT_ID>"
#   network_self_link          = "<NETWORK_SELF_LINK>"
#   private_service_connect_ip = "10.3.0.5"
#   forwarding_rule_target     = "all-apis"
# }

#Private Service Access

# resource "google_compute_global_address" "private_service_access" {
#   provider = google-beta
#   name     = "private-service-access"
#   purpose  = "VPC_PEERING"
#   address_type = "INTERNAL"
#   prefix_length = 16
#   network       = google_compute_network.vpc.self_link
#   project       = var.project_id
# }

#Private Service Connect Endpoint

resource "google_compute_forwarding_rule" "psc_endpoint" {
  provider          = google-beta
  name              = "psc-endpoint"
  load_balancing_scheme = "INTERNAL"
  network           = google_compute_network.vpc.self_link
  subnetwork        = google_compute_subnetwork.subnet.self_link
  backend_service   = var.psc_target_service
  ip_protocol       = "TCP"
  ports             = ["443"]
  project           = var.project_id
}

