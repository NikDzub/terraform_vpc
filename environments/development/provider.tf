terraform {
  # backend "s3" {
  #   bucket  = "chum_bucket"
  #   key     = "app_name.tfstate"
  #   region  = "us-east-1"
  #   profile = "terraform_user"
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  # profile                     = "terraform_user"
  access_key                  = "test"
  secret_key                  = "test"
  region                      = var.region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway   = "http://localhost:4566"
    apigatewayv2 = "http://localhost:4566"
    ec2          = "http://localhost:4566"
  }
}
