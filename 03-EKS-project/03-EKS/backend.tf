terraform {
    backend "s3" {
        bucket = "shab-terraform-backup"
        key = "EKS/terraform.tfstate"
        region = "ap-northeast-1"
    }
}