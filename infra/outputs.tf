output "rds_endpoint" {
  description = "Endpoint do banco RDS do monolito (DB_HOST)"
  value       = aws_db_instance.main.address
}

output "core_service_rds_endpoint" {
  description = "Endpoint do banco RDS do core-service (DB_HOST)"
  value       = aws_db_instance.core_service.address
}

output "stock_service_rds_endpoint" {
  description = "Endpoint do banco RDS do stock-service (DB_HOST)"
  value       = aws_db_instance.stock_service.address
}

output "billing_service_rds_endpoint" {
  description = "Endpoint do banco RDS do billing-service (DB_HOST)"
  value       = aws_db_instance.billing_service.address
}

output "repair_service_table_name" {
  description = "Nome da tabela DynamoDB do repair-service"
  value       = aws_dynamodb_table.repair_service.name
}

output "repair_service_table_arn" {
  description = "ARN da tabela DynamoDB do repair-service"
  value       = aws_dynamodb_table.repair_service.arn
}
