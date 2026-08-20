resource "aws_db_subnet_group" "main" {
  name       = "${var.projectName}-db-subnet-group"
  subnet_ids = data.aws_subnets.private.ids

  tags = var.tags
}

resource "aws_db_instance" "main" {
  identifier        = "${var.projectName}-db"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"

  monitoring_interval = 0

  db_name  = "mechanical_hub_db"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [data.aws_security_group.rds.id]

  skip_final_snapshot = true
  publicly_accessible = false

  tags = var.tags
}
