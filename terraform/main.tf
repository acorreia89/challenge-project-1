module "s3-bucket" {
  source = "./s3-bucket"

}

module "eks" {
  source       = "./eks/cluster"
  region       = var.region
  cluster_name = var.cluster_name
}

module "karpenter" {
  source                 = "./eks/karpenter"
  cluster_name           = module.eks.cluster_name
  cluster_endpoint       = module.eks.cluster_endpoint
  cluster_ca_certificate = module.eks.cluster_certificate_authority
}

module "addons" {
  source = "./eks/addons"

  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
cluster_ca_data  = module.eks.cluster_certificate_authority

}
