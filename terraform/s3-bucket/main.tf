# Dedicated KMS key to encrypt state in S3
resource "aws_kms_key" "tfstate" {
  deletion_window_in_days = 10
  enable_key_rotation     = true
  description             = "Dedicated KMS key to encrypt state in S3"
}

# Set Alias ​​S3 bucket
resource "aws_kms_alias" "tfstate" {
  name          = var.kms_key_alias
  target_key_id = aws_kms_key.tfstate.key_id
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "tfstate" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tfstate.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# Bucket Policy: Requires TLS (SecureTransport)
data "aws_iam_policy_document" "tfstate_bucket_policy" {
  statement {
    sid     = "DenyInsecureTransport"
    actions = ["s3:*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    resources = [
      aws_s3_bucket.tfstate.arn,
      "${aws_s3_bucket.tfstate.arn}/*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
    effect = "Deny"
  }
}

resource "aws_s3_bucket_policy" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  policy = data.aws_iam_policy_document.tfstate_bucket_policy.json
}

