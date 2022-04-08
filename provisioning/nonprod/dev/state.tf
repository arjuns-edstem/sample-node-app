terraform {
  required_version = ">=1.1.2"

  backend "s3" {
    region = "us-east-1"
    bucket = "sample-app-state"
    key = "nonprod/sample-node-app/dev/terraform.tfstate"
    encrypt = "true"
    dynamodb_table = "edstem-np-terraform-lock-table"
  }
}