variable "gcp_project" {
  type        = string
  description = "GCP Project ID"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "prod"
}

variable "database_version" {
  type        = string
  description = "PostgreSQL version"
  default     = "POSTGRES_15"
}

variable "database_tier" {
  type        = string
  description = "Cloud SQL instance tier"
  default     = "db-custom-4-16384"
}

variable "database_disk_size" {
  type        = number
  description = "Storage size in GB"
  default     = 500
}