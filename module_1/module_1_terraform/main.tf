terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "vocal-tracer-484119-t7"
  region  = "us-central1"
}


resource "google_storage_bucket" "gcs-bucket" {
  name          = "de_zoomcamp_homework_gcs_bucket"
  location      = "US"

  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30 
    }
  }

  force_destroy = true
}


resource "google_bigquery_dataset" "dataset" {
  dataset_id = "de_zoocamp_homework_dataset"
  project    = "vocal-tracer-484119-t7"
  location   = "US"
}