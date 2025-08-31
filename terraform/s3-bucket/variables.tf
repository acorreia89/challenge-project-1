variable "region" {
  type        = string
  default     = "sa-east-1"
  description = "Aws Region"
}

variable "bucket_name" {
  type        = string
  default = "s3-bucket-challenge-project-1"
  description = "Bucket Name"
}


variable "force_destroy" {
  type    = bool
  default = false
}

variable "kms_key_alias" {
  type    = string
  default = "alias/terraform-state"
}

