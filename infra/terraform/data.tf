data "aws_iam_policy_document" "assume_role_eks" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "assume_role_ec2" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_arn" "current_user" {
  arn = data.aws_caller_identity.current.arn
}

data "aws_caller_identity" "current" {}

data "aws_eks_cluster_auth" "arik-service1" {
  name = "arik-service1"
}

data "aws_eks_cluster" "arik-service1" {
  name = "arik-service1"

  depends_on = [aws_eks_cluster.arik-service1]
}