resource "aws_s3_bucket" "chum_bucket" {
  bucket = "chum_bucket"
  tags = {
    Name = "${var.env_prefix}_chum_bucket"
  }
}
resource "aws_s3_bucket_acl" "chum_bucket_acl" {
  bucket = aws_s3_bucket.chum_bucket.id
  acl    = "private"
}

