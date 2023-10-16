output "pool_name" {
  description = "Pool name"
  value       = module.terraform_oidc.pool_name
  sensitive   = false
}