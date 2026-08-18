# Reference the Remote state from EKS
data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "terraform-state-bucket-suraj"
    key = "eks/dev/terraform.tfstate"
    region = var.aws_region
  }
}

output "eks_cluster_name" {
  value = data.terraform_remote_state.eks.outputs.eks_cluster_name
}

output "eks_cluster_id" {
  value = data.terraform_remote_state.eks.outputs.eks_cluster_id
}