terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  project = "terraform-gcp-422422"
  region  = "us-central1"
  zone    = "us-central1-a"
  credentials = "keys.json"
}
