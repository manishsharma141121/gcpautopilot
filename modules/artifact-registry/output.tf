output "region" {
  value = google_artifact_registry_repository.artifact-repository.location
  description = "Region for the service"
}
output "repo_name" {
    value = google_artifact_registry_repository.artifact-repository.repository_id
    description = "GAR name"
}
