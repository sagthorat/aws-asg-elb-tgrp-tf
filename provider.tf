terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }
}

provider "aws" {
  region              = "us-east-1"
  shared_config_files = [var.tfc_aws_dynamic_credentials.default.shared_config_file]
  //aws.workload.identity and PersonalOrg28082024
  default_tags {
    tags = {
      DeployedBy = "Terraform Cloud"
      Project    = "DeleteMe"
    }
  }
}