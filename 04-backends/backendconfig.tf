
resource "random_id" "randombucketid" {

  byte_length = 8
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "backends3-${random_id.randombucketid.hex}"

}
output "name_s3bucket_created" {
  value = aws_s3_bucket.s3_bucket.bucket
}
