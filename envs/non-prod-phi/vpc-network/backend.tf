terraform {
  backend "gcs" {
    bucket = "Name of the backend bucket"
    prefix = "/resources/env/non-prod-phi/vpc-network"
  }
}