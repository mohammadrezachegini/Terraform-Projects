terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.6.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp"
  region = "us-central1"
}