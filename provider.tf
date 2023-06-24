
# Initialize Provider 
provider "aws" {
  region = var.AWS_REGION
}

# This is necessary if you use remote backend. Comment it out if you use local backend. 
terraform {
  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "${var.backend_bucket_name}"
    key            = "${var.backend_state_location}"
    region         = "${var.backend_region}"
    dynamodb_table = "${var.dynamodb_id}"
    encrypt        =  var.encrypt_tfstate 
  }
}


data "aws_availability_zones" "available" {}

