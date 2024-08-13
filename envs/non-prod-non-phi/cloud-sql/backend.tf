terraform {
  backend "gcs" {
    bucket = "Name of the backend bucket"
    prefix = "/resources/env/non-prod-non-phi/cloud-sql"
  }
}