terraform {
  backend "s3" {
    bucket       = "s3-bucket-challenge-project-1"
    key          = "eks/prod/terraform.tfstate"
    region       = "sa-east-1"
    use_lockfile = true
    encrypt      = true
  }
}