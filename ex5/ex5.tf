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
}
provider "aws" {
  region = "eu-west-1"
}
resource "random_id" "randombucketid" {

  byte_length = 8
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "example-bucket-${random_id.randombucketid.hex}"

}
output "name_s3bucket_created" {
  value = aws_s3_bucket.s3_bucket.bucket
}
