output "state_bucket" {
  value = aws_s3_bucket.tfstate.bucket
}

output "kms_key_arn" {
  value = aws_kms_key.tfstate.arn
}