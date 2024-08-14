module "google_sql_database_instance" {
    source = "../../modules/cloud-sql"
  for_each =      var.instance_name
  project_id        = var.project #"your-gcp-project-id"
  vpc_name          = var.vpc_name #"your-vpc-name"
  subnet_name       = var.subnet_name #"your-subnet-name"
  region            = var.region #"us-central1"
  db_instance_name = "${each.value}-${lookup(var.databases, each.key, "" )}-${lookup(var.namespaces, each.key, "")}-sqldb"
  private_service_connect = true 
}
 
module "google_secret_manager_secret" {
    source = "../../modules/cloud-sql"
  for_each =      var.SecretID #local terrafrom variable
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  secret_id = lookup(each.value, "db_master_password", null)
  
}
module "google_sql_user" {
    source = "../../modules/cloud-sql"
  for_each =      var.user_name
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  db_master_username = lookup(each.value, "name", null)

}
module "google_sql_database" {
    source = "../../modules/cloud-sql"
  for_each =      var.databases
  project_id        = var.project #"your-gcp-project-id"
  region            = var.region #"us-central1"
  databases = lookup(each.value, "name", null)
}

