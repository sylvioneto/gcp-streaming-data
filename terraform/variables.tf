locals {
  resource_labels = {
    terraform = "true"
    app       = "ingest-api"
    env       = "sandbox"
    repo      = "gcp-streaming-data"
  }
}

variable "project_id" {
  description = "GCP Project ID"
  default     = null
}

variable "region" {
  type        = string
  description = "GCP region"
  default     = "us-east1"
}

variable "gcp_ingest_api_image" {
  description = "Container image to use on Cloud Run ingest API"
  default     = "us-central1-docker.pkg.dev/syl-data-analytics/docker-repo/gcp-ingest-api:05c3f04e-e3b5-41c7-a028-6b3eae3e4fab"
}
