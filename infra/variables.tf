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
  description = "Senha do banco de dados RDS"
  type        = string
  sensitive   = true
}
