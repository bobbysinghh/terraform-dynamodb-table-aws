resource "aws_dynamodb_table" "this" {
  count          = var.create_table ? 1 : 0
  name           = var.name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key

  ttl {
    enabled        = var.ttl_enabled
    attribute_name = var.ttl_attribute_name
  }

  dynamic "attribute" {
    for_each = var.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )

}