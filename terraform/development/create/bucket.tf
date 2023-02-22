resource "aws_s3_bucket" "bucketdev" {
  bucket = var.aws_bucket_name
  tags = {
    Environment = var.env
  }
}

resource "aws_s3_bucket_acl" "bucketdev" {
  bucket = var.aws_bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_lifecycle_configuration" "bucketdev" {
  bucket = var.aws_bucket_name
  rule {
    id = "cleanup"
    filter {} # applies to all objects in bucket
    status = "Enabled"
    expiration {
      days = 1
    }
  }
}
