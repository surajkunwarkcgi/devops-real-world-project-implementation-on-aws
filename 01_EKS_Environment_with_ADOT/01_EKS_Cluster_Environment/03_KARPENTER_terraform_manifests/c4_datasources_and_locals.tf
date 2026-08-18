# Data Source: AWS Account Info
data "aws_caller_identity" "current" {}

# Data Source: AWS Region
data "aws_region" "current" {}

# Local values used throughout the EKS configuration
locals {
  owners = var.business_division

  environment = var.environment_name

  name = "${local.owners}-${local.environment}"

  cluster_name = data.terraform_remote_state.eks.outputs.eks_cluster_name
}