variable "create_table" {
  description = "Controls if DynamoDB table and associated resources are created"
  type        = bool
  default     = true
}
variable "name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = null
}
variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties: name - (Required) The name of the attribute, type - (Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = list(map(string))
  default     = []
}
variable "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  default     = null
}
variable "range_key" {
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
  default     = null
}
variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  type        = bool
  default     = false
}
variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in"
  type        = string
  default     = ""
}
variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  type        = number
  default     = null
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  type        = number
  default     = null
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
