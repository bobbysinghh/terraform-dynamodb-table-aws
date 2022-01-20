resource "random_pet" "this" {
  length = 2
}

module "dynamoDB_table" {
  source             = "./module/dynamodb"
  create_table       = true
  name               = "my-table-${random_pet.this.id}"
  hash_key           = "id"
  range_key          = "title"
  ttl_enabled        = true
  ttl_attribute_name = "TimeToExist"
  attributes = [
    {
      name = "id"
      type = "N"
    },
    {
      name = "title"
      type = "S"
    },
    {
      name = "age"
      type = "N"
    }
  ]

  global_secondary_indexes = [
    {
      name               = "TitleIndex"
      hash_key           = "title"
      range_key          = "age"
      projection_type    = "INCLUDE"
      non_key_attributes = ["id"]
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}