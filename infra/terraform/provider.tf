terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.1"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.arik-service1.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.arik-service1.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.arik-service1.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.arik-service1.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.arik-service1.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.arik-service1.token
  }
}