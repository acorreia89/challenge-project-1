output "karpenter_release_name" {
  value = helm_release.karpenter.name
}

output "karpenter_namespace" {
  value = helm_release.karpenter.namespace
}
