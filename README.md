# Terraform GCP Terraform Cloud OIDC Provider
[![CI](https://github.com/saidsef/terraform-gcp-terraform-cloud-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-gcp-terraform-cloud-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-gcp-terraform-cloud-oidc.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-gcp-terraform-cloud-oidc?ref=badge_shield)

This Terraform module enables you to configure Terraform Cloud as an GCP IAM OIDC identity provider in GCP, which enables Terraform Cloud to access resources within an GCP Projects(s) without requiring long-lived credentials to be stored as Terraform Cloud Variables.

## Prerequisites

- GCP Project(s) and credentials
- Terraform Cloud Account(s)
- Git repository integration with Terraform Cloud
- Terraform >= 1.x
- Profit?

## Deployment / Usage

```terraform
provider "google" {
  region  = var.region
  project = var.project_id
}

provider "google-beta" {
  region  = var.region
  project = var.project_id
}

module "terraform_cloud" {
  source  = "saidsef/terraform-cloud-oidc/gcp"
  version = ">= 1"

  organisation     = "saidsef"
  projects         = [{ "project" : "platform", "workspaces" : "dev" }]
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md) and [Terraform token specification](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/workload-identity-tokens#token-specification)

## Terraform Cloud Configure trust variables

After you have create a workspace, navigate to the Variables page and add the following variables:

| Category | Key | Value | Sensitive | Required |
| -------- | --- | ----- | --------- | -------- |
| Environment variable | TFC_GCP_PROVIDER_AUTH | true | false | Yes |
| Environment variable | TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL | The service account email Terraform Cloud will use when authenticating to GCP| false | Yes |
| Environment variable | TFC_GCP_WORKLOAD_PROVIDER_NAME | The canonical name of the workload identity provider. | false | Yes |
| Environment variable | TFC_GCP_WORKLOAD_IDENTITY_AUDIENCE | `[]` | false | No |

> **_NOTE:_** You can undelete a provider for up to 30 days after deletion. After 30 days, deletion is permanent. Until a provider is permanently deleted, you cannot reuse its name when creating a new provider.

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## Source

Our latest and greatest source of `terraform-gcp-terraform-cloud-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-gcp-terraform-cloud-oidc/fork). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-gcp-terraform-cloud-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.

## Useful Links

- [Terraform Pool Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider)
- [Terraform Attribute Maping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_mapping)
- [Terraform Token Specification](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/workload-identity-tokens#token-specification)
- [GCP Configuration](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/gcp-configuration)

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-gcp-terraform-cloud-oidc.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fsaidsef%2Fterraform-gcp-terraform-cloud-oidc?ref=badge_large)
