# Tabela do repair-service (unico servico com banco NoSQL -- ver ADR-003).
# Vive aqui junto com os bancos relacionais pela mesma regra: todo
# provisionamento de banco de dados fica centralizado no infra-database,
# independente do tipo (SQL ou NoSQL).
resource "aws_dynamodb_table" "repair_service" {
  name         = "${var.projectName}-repair-service"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "PK"
  range_key = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  attribute {
    name = "EntityType"
    type = "S"
  }

  # Single-table design: order_tasks, services (catalogo) e materials
  # (catalogo) ficam na mesma tabela, diferenciados pelo prefixo da PK
  # (ORDERTASK#, SERVICE#, MATERIAL#).
  #
  # O GSI existe porque o catalogo (services/materials) precisa ser listado
  # por tipo (ex: "todos os servicos do catalogo"), o que a PK/SK principal
  # nao resolve sem um scan completo da tabela.
  global_secondary_index {
    name            = "EntityTypeIndex"
    hash_key        = "EntityType"
    range_key       = "SK"
    projection_type = "ALL"
  }

  tags = var.tags
}
