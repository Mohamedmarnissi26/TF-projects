terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {

  }
}
provider "aws" {
  region = "eu-west-1"
  alias  = "eu"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us"
}


resource "random_id" "bucket_id" {
  byte_length = 8
}


resource "aws_s3_bucket" "my_bucket_eu_west_1" {
  bucket   = "euwest1bucket${random_id.bucket_id.hex}"
  provider = aws.eu
}

resource "aws_s3_bucket" "my_bucket_us_east_1" {
  bucket   = "useast1bucket${random_id.bucket_id.hex}"
  provider = aws.us

}
