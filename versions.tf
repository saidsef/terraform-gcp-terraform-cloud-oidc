terraform {
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 4, < 7"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4, < 7"
    }
  }

  required_version = "~> 1"
}
