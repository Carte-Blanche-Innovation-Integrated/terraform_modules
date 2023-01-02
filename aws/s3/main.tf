resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = var.common_tags
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  count  = var.block_bucket_public_access ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  count = var.is_rest_encrypted ? 1 : 0

  bucket = aws_s3_bucket.bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  count = var.versioning ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  count = length(var.cors_rules) >= 1 ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  dynamic "cors_rule" {
    for_each = { for i, rule in var.cors_rules : i => rule }

    content {
      allowed_headers = lookup(each.value, "allowed_headers", ["*"])
      allowed_methods = lookup(each.value, "allowed_methods", ["GET", "HEAD"])
      allowed_origins = lookup(each.value, "allowed_origins", ["*"])
      expose_headers  = lookup(each.value, "expose_headers", ["ETag"])
      max_age_seconds = lookup(each.value, "max_age_seconds", 3000)
    }
  }
}

resource "aws_s3_bucket_policy" "policy" {
  count = var.bucket_policy != null ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  policy = var.bucket_policy
}
