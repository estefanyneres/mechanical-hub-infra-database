output "rds_endpoint" {
  description = "Endpoint do banco RDS (DB_HOST)"
  value       = aws_db_instance.main.address
}
