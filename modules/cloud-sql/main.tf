resource "google_sql_database_instance" "mysql_instance" {
    name    =var.instance_name
    database_version = "mysql_8_0"
    region = var.region
    project = var.project_id

    settings {
      tier = "db-f1-micro"
    }
  
}

module "private_service_connect" {
  source                     = "terraform-google-modules/network/google//modules/private-service-connect"

  project_id                 = "<PROJECT_ID>"
  network_self_link          = "<NETWORK_SELF_LINK>"
  private_service_connect_ip = "10.3.0.5"
  forwarding_rule_target     = "all-apis"
}