terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
  backend "s3" {
    bucket         = "harshadevops-dev"
    key            = "harshadevops-dev-v4"
    region         = "us-east-1"
    dynamodb_table = "harshadevops-dev"
  }
}

provider "aws" {
  region = "us-east-1"
}