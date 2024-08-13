module "private_service_connect" {
  source = "../../../modules/cloud-sql"

  project_id        = "your-gcp-project-id"
  vpc_name          = "your-vpc-name"
  subnet_name       = "your-subnet-name"
  region            = "us-central1"
  psc_target_service = "your-target-service"
}