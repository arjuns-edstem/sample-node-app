variable "env" {
}

variable "aws_region" {
  default = "us-east-1"
}

variable "app_port" {
  default = 3000
}

variable "app_image" {
  default = "208671518622.dkr.ecr.us-east-1.amazonaws.com/sample-node-app"
}

variable "logs_retention_in_days" {
  default = 14
}


