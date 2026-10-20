
locals {
  vpc_id             = data.terraform_remote_state.networking.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.networking.outputs.private_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.networking.outputs.public_subnet_ids
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "shab-eks-cluster"
  kubernetes_version = "1.33"

  # Disable IRSA/OIDC provider creation to avoid AWS SCP restriction
  enable_irsa = false

  addons = {
    coredns = {}

    eks-pod-identity-agent = {
      before_compute = true
    }

    kube-proxy = {}

    vpc-cni = {
      before_compute = true
    }
  }

  # Optional
  endpoint_public_access = true

  # Adds the current caller identity as a cluster administrator
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = local.vpc_id
  subnet_ids               = local.private_subnet_ids
  control_plane_subnet_ids = local.public_subnet_ids

  # EKS Managed Node Groups
  eks_managed_node_groups = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m7i-flex.large"]

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
