terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  alias = "region"
}

data "aws_region" "current" {}
