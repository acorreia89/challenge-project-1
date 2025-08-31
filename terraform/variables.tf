variable "region" {
  type        = string
  default     = "sa-east-1"
  description = "Aws Region"
}


variable "cluster_name" {
  type        = string
  default     = "eks-challenge-1"
  description = "EKS ClusterName"
}
