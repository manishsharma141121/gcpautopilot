module "artifact_registry" {
  source = "../../../modules/artifact-registry"
  region_name = var.region
  project_id = var.project
  repo_id = var.repo
  format_type = var.format
  labels = var.labels
  description = var.description
}