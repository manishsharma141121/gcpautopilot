resource "google_sql_database_instance" "mysql_instance" {
    name    =var.instance_name
    database_version = var.database_version
    region = var.region
    project = var.project_id

    settings {
      tier = "db-f1-micro"
    }
  
}

# module "private_service_connect" {
#   source                     = "terraform-google-modules/network/google//modules/private-service-connect"

#   project_id                 = "<PROJECT_ID>"
#   network_self_link          = "<NETWORK_SELF_LINK>"
#   private_service_connect_ip = "10.3.0.5"
#   forwarding_rule_target     = "all-apis"
# }

#Private Service Access

resource "google_compute_global_address" "private_service_access" {
  provider = google-beta
  name     = "private-service-access"
  purpose  = "VPC_PEERING"
  address_type = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.self_link
  project       = var.project_id
}

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

