# Uma instancia RDS por microsservico que usa Postgres (core-service,
# stock-service, billing-service). Decisao: nao reaproveitar a instancia do
# monolito nem criar um banco adicional nela via conexao direta -- isso
# exigiria uma ponte de rede pra dentro da VPC (a instancia e privada), por
# isso cada servico ganha a propria instancia, com o banco inicial criado
# pela propria API da AWS no momento da criacao (mesmo mecanismo que ja cria
# o "mechanical_hub_db" do monolito em rds.tf, sem precisar de nenhuma
# conexao direta no Postgres).
resource "aws_db_instance" "core_service" {
  identifier        = "${var.projectName}-core-service-db"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"

  monitoring_interval = 0

  db_name  = "core_service_db"
  username = var.db_username
  password = var.core_service_db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [data.aws_security_group.rds.id]

  skip_final_snapshot = true
  publicly_accessible = false

  tags = var.tags
}

resource "aws_db_instance" "stock_service" {
  identifier        = "${var.projectName}-stock-service-db"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"

  monitoring_interval = 0

  db_name  = "stock_service_db"
  username = var.db_username
  password = var.stock_service_db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [data.aws_security_group.rds.id]

  skip_final_snapshot = true
  publicly_accessible = false

  tags = var.tags
}

resource "aws_db_instance" "billing_service" {
  identifier        = "${var.projectName}-billing-service-db"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"

  monitoring_interval = 0

  db_name  = "billing_service_db"
  username = var.db_username
  password = var.billing_service_db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [data.aws_security_group.rds.id]

  skip_final_snapshot = true
  publicly_accessible = false

  tags = var.tags
}
