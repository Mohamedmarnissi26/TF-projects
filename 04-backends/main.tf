terraform {
  required_version = "~> 1.7"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "backends3-9cb1d7f2f07cd9f4"
    key          = "04-backends/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true

  }
}
provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test_vpc"
  }

}
