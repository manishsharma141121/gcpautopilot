output "region" {
  value = module.artifact_registry.region
  description = "Region for the service"
}
output "repo_name" {
    value =module.artifact_registry.repo_name
    description = "GAR name"
}
