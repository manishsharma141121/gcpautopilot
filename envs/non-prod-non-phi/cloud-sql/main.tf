module "private_service_connect" {
  source = "../../modules/cloud-sql"

  project_id        = var.project #"your-gcp-project-id"
  vpc_name          = var.vpc_name #"your-vpc-name"
  subnet_name       = var.subnet_name #"your-subnet-name"
  region            = var.region #"us-central1"
  psc_target_service = var.psc_target_service #"your-target-service"
}