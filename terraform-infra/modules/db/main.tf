variable "db_specs" {
  type = list(object({
    size    = string
    name    = string
    db_type = string
  }))
}

resource "aws_db_instance" "db" {
  for_each = { for idx, db in var.db_specs : idx => db }

  identifier          = each.value.name
  instance_class      = each.value.size
  engine              = each.value.db_type
  allocated_storage   = 20
  username            = "admin"
  password            = "admin123"
  skip_final_snapshot = true
}
