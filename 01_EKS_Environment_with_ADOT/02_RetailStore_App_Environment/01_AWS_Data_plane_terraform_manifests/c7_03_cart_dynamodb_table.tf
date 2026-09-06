# DynamoDB Table: Items - ap-southeast-1
resource "aws_dynamodb_table" "items_south1" {
  provider = aws.south1
  name = "Items"
  billing_mode = "PAY_PER_REQUEST"   # On-demand pricing (no capacity planning)
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "customerId"
    type = "S"
  }

  # Global Secondary Index for customer-based lookups
  global_secondary_index {
    name = "idx_global_customerId"
    hash_key = "customerId"
    projection_type = "ALL"
  }

  tags = {
    Name        = "Items"
    Environment = var.environment_name
    Component   = "Cart"
  }
}