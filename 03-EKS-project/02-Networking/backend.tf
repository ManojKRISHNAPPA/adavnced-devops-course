terraform {
    backend "s3" {
        bucket = "shab-terraform-backup"
        key = "networking/terraform.tfstate"
        region = "ap-northeast-1"
    }
}