terraform {
    required_version = "~> 1.1.7" 
    required_providers {
     google = "~> 4.8.0"
  }
}
provider "google" {
}

terraform {
  backend "gcs" {
    bucket  = "jabv-dev-aidplt-0-usmr-terraform"
    prefix  = "terraform/state"
  }
}
