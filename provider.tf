
# Initialize Provider 
provider "aws" {
  region = var.AWS_REGION
}

# This is necessary if you use remote backend
terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "bucket_name"
    key            = "state_location"
    region         = "aws_region"
    dynamodb_table = "state_lock"
    encrypt        = "true"
  }
}


data "aws_availability_zones" "available" {}

