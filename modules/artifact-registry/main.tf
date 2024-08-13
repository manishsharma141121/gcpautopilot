resource "google_artifact_registry_repository" "artifact-repository" {
 location = var.region_name
 project = var.project_id
 repository_id = var.repo_id
 description = var.description
 format = var.format_type
 labels = var.labels
}