# GCP Project and Region
project_id = "test-project123"
region     = "us-central1"

#Cloud SQL instance varible value
instance_tier = "db-f1-micro"
availability_type = "zonal"
ipv4_enabled = true
require_ssl = false
databases = []
secret_manager_secret_name = "cloud-sql-passwords"
db_users = "root"
# Kubernetes Namespaces and Ingress Configuration
namespaces           = ["dev", "alpha"]  # Replace with your namespaces
ingress_service_name = "dev"  # Replace with your service name
ingress_service_port = 80  # Replace with your service port