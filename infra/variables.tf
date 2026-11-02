variable "projectName" {
  default = "mechanical-hub"
}

variable "region_default" {
  default = "us-east-1"
}

variable "tags" {
  default = {
    School      = "FIAP"
    Environment = "Production"
  }
}

variable "db_username" {
  description = "Usuario administrador do banco de dados RDS"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Senha do banco de dados RDS do monolito (mechanical-hub)"
  type        = string
  sensitive   = true
}

variable "core_service_db_password" {
  description = "Senha do banco de dados RDS do core-service"
  type        = string
  sensitive   = true
}

variable "stock_service_db_password" {
  description = "Senha do banco de dados RDS do stock-service"
  type        = string
  sensitive   = true
}

variable "billing_service_db_password" {
  description = "Senha do banco de dados RDS do billing-service"
  type        = string
  sensitive   = true
}
