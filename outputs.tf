output "database_instance_name" {
  value       = google_sql_database_instance.postgres.name
  description = "Cloud SQL instance name"
}

output "database_private_ip" {
  value       = google_sql_database_instance.postgres.private_ip_address
  description = "Database private IP address"
}

output "database_self_link" {
  value       = google_sql_database_instance.postgres.self_link
  description = "Database instance self link"
}

output "database_connection_name" {
  value       = google_sql_database_instance.postgres.connection_name
  description = "Database connection name for Cloud SQL Proxy"
}