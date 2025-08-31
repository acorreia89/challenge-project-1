variable "cluster_name" {
  type        = string
  description = "Nome do cluster EKS"
}

variable "cluster_endpoint" {
  type        = string
  description = "Endpoint do cluster EKS"
}

variable "cluster_ca_certificate" {
  type        = string
  description = "CA certificate do cluster EKS (base64)"
}

variable "karpenter_iam_role_arn" {
  type        = string
  description = "ARN da IAM Role do Karpenter"
}
