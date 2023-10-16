provider "google" {
  region  = var.region
  project = var.project_id
}

provider "google-beta" {
  region  = var.region
  project = var.project_id
}

module "terraform_oidc" {
  source  = "saidsef/terraform-cloud-oidc/gcp"
  version = ">= 1"

  project_id   = var.project_id
  pool_id      = "terraform-cloud"
  organisation = "saidsef"
}