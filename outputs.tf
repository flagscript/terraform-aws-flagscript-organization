# Organization outputs
output "org_arn" {
  description = "Arn of the flagscript organization."
  value       = aws_organizations_organization.flagscript_org.arn
}

output "org_id" {
  description = "Id of the flagscript organization."
  value       = aws_organizations_organization.flagscript_org.id
}

## Deployments ou outputs
output "deployments_ou_arn" {
  description = "Arn of the deployments ou."
  value       = module.deployments_ou.ou_arn
}

output "deployments_ou_id" {
  description = "Id of the deployments ou."
  value       = module.deployments_ou.ou_id
}

output "test_deployments_ou_arn" {
  description = "Arn of the test deployments ou."
  value       = module.deployments_ou.test_ou_arn
}

output "test_deployments_ou_id" {
  description = "Id of the test deployments ou."
  value       = module.deployments_ou.test_ou_id
}

output "prod_deployments_ou_arn" {
  description = "Arn of the prod deployments ou."
  value       = module.deployments_ou.prod_ou_arn
}

output "prod_deployments_ou_id" {
  description = "Id of the prod deployments ou."
  value       = module.deployments_ou.prod_ou_id
}

# Infrastructure ou outputs
output "infrastructure_ou_arn" {
  description = "Arn of the infrastructure ou."
  value       = module.infrastructure_ou.ou_arn
}

output "infrastructure_ou_id" {
  description = "Id of the infrastructure ou."
  value       = module.infrastructure_ou.ou_id
}

output "test_infrastructure_ou_arn" {
  description = "Arn of the test infrastructure ou."
  value       = module.infrastructure_ou.test_ou_arn
}

output "test_infrastructure_ou_id" {
  description = "Id of the test infrastructure ou."
  value       = module.infrastructure_ou.test_ou_id
}

output "prod_infrastructure_ou_arn" {
  description = "Arn of the prod infrastructure ou."
  value       = module.infrastructure_ou.prod_ou_arn
}

output "prod_infrastructure_ou_id" {
  description = "Id of the prod infrastructure ou."
  value       = module.infrastructure_ou.prod_ou_id
}

# Security ou outputs
output "security_ou_arn" {
  description = "Arn of the security ou."
  value       = module.security_ou.ou_arn
}

output "security_ou_id" {
  description = "Id of the security ou."
  value       = module.security_ou.ou_id
}

output "test_security_ou_arn" {
  description = "Arn of the test security ou."
  value       = module.security_ou.test_ou_arn
}

output "test_security_ou_id" {
  description = "Id of the test security ou."
  value       = module.security_ou.test_ou_id
}

output "prod_security_ou_arn" {
  description = "Arn of the prod security ou."
  value       = module.security_ou.prod_ou_arn
}

output "prod_security_ou_id" {
  description = "Id of the prod security ou."
  value       = module.security_ou.prod_ou_id
}

# Suspended ou outputs
output "suspended_ou_arn" {
  description = "Arn of the suspended ou."
  value       = module.suspended_ou.ou_arn
}

output "suspended_ou_id" {
  description = "Id of the suspended ou."
  value       = module.suspended_ou.ou_id
}

# Workloads ou outputs
output "workloads_ou_arn" {
  description = "Arn of the workloads ou."
  value       = module.workloads_ou.ou_arn
}

output "workloads_ou_id" {
  description = "Id of the workloads ou."
  value       = module.workloads_ou.ou_id
}
