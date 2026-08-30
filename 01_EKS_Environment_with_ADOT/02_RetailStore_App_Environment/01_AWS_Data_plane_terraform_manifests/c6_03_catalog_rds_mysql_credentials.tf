# Use existing AWS Secrets Manager Secret (already created)
data "aws_secretsmanager_secret" "retailstore_secret" {
  name = "retailstore-db-secret-1"
}

data "aws_secretsmanager_secret_version" "retailstore_secret_value" {
  secret_id = data.aws_secretsmanager_secret.retailstore_secret.id
}

locals {
  retailstore_secret_json = jsondecode(data.aws_secretsmanager_secret_version.retailstore_secret_value.secret_string)
}

output "debug_retailstore_secret_username" {
  description = "⚠️ For testing only: DB username from Secrets Manager"
  value       = local.retailstore_secret_json.username
  sensitive   = true
}

output "debug_retailstore_secret_password" {
  description = "⚠️ For testing only: DB password from Secrets Manager"
  value       = local.retailstore_secret_json.password
  sensitive   = true
}