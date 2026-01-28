resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-bucket-demo"

  tags = {
    Name = "${var.environment}-bucket-demo"
    Env  = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
