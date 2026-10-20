variable "project_name" {
  description = "Project name"
  type        = string
  default     = "shab-eks-project"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2c", "us-east-2d"]
}