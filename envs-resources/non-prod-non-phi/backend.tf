terraform {
  backend "gcs" {
    bucket = "Name of the backend bucket"
    prefix = "/resources/env/nonprod-nonphi/cloud-sql"
  }
}