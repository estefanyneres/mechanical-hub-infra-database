data "aws_vpc" "base" {
  filter {
    name   = "tag:Name"
    values = [var.projectName]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.base.id]
  }

  tags = {
    Tier = "private"
  }
}

data "aws_security_group" "rds" {
  filter {
    name   = "tag:Name"
    values = ["${var.projectName}-rds-sg"]
  }
}
