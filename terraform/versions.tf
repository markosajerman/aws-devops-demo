terraform {
  required_version = ">=1.0.0"

  required_providers {
    # AWS provider - configured to use LocalStack insted of real AWS
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS provider configuration pointing to LocalStack
provider "aws" {
  region = var.aws_region

  # LocalStack endpoint 
  endpoints {
    s3  = "http://localhost:4566"
    ecr = "http://localhost:4566"
  }

  # Credentials
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true
}

