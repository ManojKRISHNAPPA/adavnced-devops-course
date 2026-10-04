data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
        bucket = "shab-terraform-backup"
        key = "networking/terraform.tfstate"
        region = "ap-northeast-1"
  }
}