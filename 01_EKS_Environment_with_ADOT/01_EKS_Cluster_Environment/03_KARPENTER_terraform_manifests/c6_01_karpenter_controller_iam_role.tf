data "aws_iam_policy_document" "karpenter_controller_assume" {
  statement {
    sid = "PodIdentity"
    actions = [
        "sts:AssumeRole",
        "sts:TagSession"
    ]

    principals {
      type = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "karpenter_controller" {
  name = "${local.name}-karpenter-controller-role"
  assume_role_policy = data.aws_iam_policy_document.karpenter_controller_assume.json
  tags = var.tags
}

output "karpenter_controller_role_name" {
  description = "IAM role name used by the Karpenter Controller"
  value = aws_iam_role.karpenter_controller.name
}

output "karpenter_controller_role_arn" {
  description = "IAM role ARN for the Karpenter Controller"
  value = aws_iam_role.karpenter_controller.arn
}