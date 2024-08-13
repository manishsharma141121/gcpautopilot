# Configure the Google Cloud provider
provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"  # Choose the region appropriate for you
}

# Define the GKE Autopilot cluster
resource "google_container_cluster" "autopilot_cluster" {
  name     = "my-autopilot-cluster"
  location = "us-central1"  # Choose the region appropriate for you

  # Enable Autopilot mode
  autopilot {
    enabled = true
  }

  # Optional: Define Kubernetes network policy
  network_policy {
    enabled = true
  }

  # Optional: Define logging and monitoring settings
  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  # Optional: Enable various features
  enable_autoscaling = true
  enable_network_policy = true
}

# Output the cluster endpoint
output "cluster_endpoint" {
  value = google_container_cluster.autopilot_cluster.endpoint
}

# Output the cluster master version
output "cluster_master_version" {
  value = google_container_cluster.autopilot_cluster.master_version
}