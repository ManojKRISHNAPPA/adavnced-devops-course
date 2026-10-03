provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0990bd2af79bd53a7"
    instance_type = "t2.micro"
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
    }
}