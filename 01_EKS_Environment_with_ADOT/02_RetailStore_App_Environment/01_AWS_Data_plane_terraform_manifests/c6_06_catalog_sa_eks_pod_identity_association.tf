# This Pod Identity Association allows the Catalog microservice (running as 
# ServiceAccount `catalog`) to assume the IAM role that has access to 
# AWS Secrets Manager.

resource "aws_eks_pod_identity_association" "catalog" {
  cluster_name    = data.terraform_remote_state.eks.outputs.eks_cluster_name
  namespace       = "default"
  service_account = "catalog"
  role_arn        = aws_iam_role.catalog_getsecrets.arn
}


# Output: Catalog MySQL Pod Identity Association ARN
output "catalog_sa_pod_identity_association_arn" {
  description = "Pod Identity Association ARN for Catalog MySQL ServiceAccount (used for AWS Secrets Manager access)"
  value       = aws_eks_pod_identity_association.catalog.association_arn
}