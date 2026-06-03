resource "google_sql_database_instance" "postgres" {
  name             = "postgres-prod-01"
  database_version = var.database_version
  region           = var.gcp_region
  
  settings {
    tier              = var.database_tier
    availability_type = "REGIONAL"
    disk_type         = "PD_SSD"
    disk_size         = var.database_disk_size
    
    backup_configuration {
      enabled                        = true
      start_time                     = "02:00"
      backup_retention_settings {
        retained_backups = 30
        retention_unit   = "COUNT"
      }
    }
    
    ip_configuration {
      require_ssl    = true
      ipv4_enabled   = false
      ipv6_enabled   = false
      private_network = data.terraform_remote_state.vpc.outputs.vpc_self_link
    }
    
    database_flags {
      name  = "log_statement"
      value = "all"
    }
    
    database_flags {
      name  = "log_min_duration_statement"
      value = "100"
    }
  }
  
  deletion_protection = true
}

resource "google_sql_database" "app_db" {
  name     = "appdb"
  instance = google_sql_database_instance.postgres.name
}