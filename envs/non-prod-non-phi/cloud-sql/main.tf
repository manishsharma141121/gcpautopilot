module "google_sql_database_instance" {
    source = "../../modules/cloud-sql"
  for_each =      var.instance_name
  project_id        = var.project #"your-gcp-project-id"
  vpc_name          = var.vpc_name #"your-vpc-name"
  subnet_name       = var.subnet_name #"your-subnet-name"
  region            = var.region #"us-central1"
  db_instance_name = lookup(each.value, "instance_name", null)
  psc_target_service = var.psc_target_service #"your-target-service"
}

module "google_secret_manager_secret" {
    source = "../../modules/cloud-sql"
  for_each =      var.instance_name
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  db_instance_name = lookup(each.value, "instance_name", null)
  secret_data = var.db_master_password
  
}
module "google_sql_user" {
    source = "../../modules/cloud-sql"
  for_each =      var.instance_name
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  db_instance_name = lookup(each.value, "instance_name", null)
  name     = var.db_master_username

}


