terraform {
  backend "gcs" {
    bucket = "Name of the backend bucket"
    prefix = "/resources/env/prod-phi/vpc-network"
  }
}