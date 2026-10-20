terraform {
    backend "s3" {
        bucket = "shab-terraform-backup"
        key = "EKS/terraform.tfstate"
        region = "us-east-2"
    }
}