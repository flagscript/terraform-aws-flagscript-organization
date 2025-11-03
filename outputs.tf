# Organization outputs
output "org_arn" {
  description = "Arn of the flagscript organization."
  value       = aws_organizations_organization.flagscript_org.arn
}

output "org_id" {
  description = "Id of the flagscript organization."
  value       = aws_organizations_organization.flagscript_org.id
}

## AFT ou outputs
output "aft_ou_arn" {
  description = "Arn of the aft ou."
  value       = aws_organizations_organizational_unit.aft_ou.arn
}

output "aft_ou_id" {
  description = "Id of the aft ou."
  value       = aws_organizations_organizational_unit.aft_ou.id
}

## Deployments ou outputs
output "deployments_ou_arn" {
  description = "Arn of the deployments ou."
  value       = aws_organizations_organizational_unit.deployments_ou.arn
}

output "deployments_ou_id" {
  description = "Id of the deployments ou."
  value       = aws_organizations_organizational_unit.deployments_ou.id
}

output "test_deployments_ou_arn" {
  description = "Arn of the test deployments ou."
  value       = aws_organizations_organizational_unit.deployments_test_ou.arn
}

output "test_deployments_ou_id" {
  description = "Id of the test deployments ou."
  value       = aws_organizations_organizational_unit.deployments_test_ou.id
}

output "prod_deployments_ou_arn" {
  description = "Arn of the prod deployments ou."
  value       = aws_organizations_organizational_unit.deployments_prod_ou.arn
}

output "prod_deployments_ou_id" {
  description = "Id of the prod deployments ou."
  value       = aws_organizations_organizational_unit.deployments_prod_ou.id
}

# Infrastructure ou outputs
output "infrastructure_ou_arn" {
  description = "Arn of the infrastructure ou."
  value       = aws_organizations_organizational_unit.infrastructure_ou.arn
}

output "infrastructure_ou_id" {
  description = "Id of the infrastructure ou."
  value       = aws_organizations_organizational_unit.infrastructure_ou.id
}

output "test_infrastructure_ou_arn" {
  description = "Arn of the test infrastructure ou."
  value       = aws_organizations_organizational_unit.infrastructure_test_ou.arn
}

output "test_infrastructure_ou_id" {
  description = "Id of the test infrastructure ou."
  value       = aws_organizations_organizational_unit.infrastructure_test_ou.id
}

output "prod_infrastructure_ou_arn" {
  description = "Arn of the prod infrastructure ou."
  value       = aws_organizations_organizational_unit.infrastructure_prod_ou.arn
}

output "prod_infrastructure_ou_id" {
  description = "Id of the prod infrastructure ou."
  value       = aws_organizations_organizational_unit.infrastructure_prod_ou.id
}

# Security ou outputs
output "security_ou_arn" {
  description = "Arn of the security ou."
  value       = aws_organizations_organizational_unit.security_ou.arn
}

output "security_ou_id" {
  description = "Id of the security ou."
  value       = aws_organizations_organizational_unit.security_ou.id
}

output "security_tooling_ou_arn" {
  description = "Arn of the security tooling ou."
  value       = aws_organizations_organizational_unit.security_tooling_ou.arn
}

output "security_tooling_ou_id" {
  description = "Id of the security tooling ou."
  value       = aws_organizations_organizational_unit.security_tooling_ou.id
}

output "test_security_tooling_ou_arn" {
  description = "Arn of the test security tooling ou."
  value       = aws_organizations_organizational_unit.security_tooling_test_ou.arn
}

output "test_security_tooling_ou_id" {
  description = "Id of the test security tooling ou."
  value       = aws_organizations_organizational_unit.security_tooling_test_ou.id
}

output "prod_security_tooling_ou_arn" {
  description = "Arn of the prod security tooling ou."
  value       = aws_organizations_organizational_unit.security_tooling_prod_ou.arn
}

output "prod_security_tooling_ou_id" {
  description = "Id of the prod security tooling ou."
  value       = aws_organizations_organizational_unit.security_tooling_prod_ou.id
}

# Suspended ou outputs
output "suspended_ou_arn" {
  description = "Arn of the suspended ou."
  value       = aws_organizations_organizational_unit.suspended_ou.arn
}

output "suspended_ou_id" {
  description = "Id of the suspended ou."
  value       = aws_organizations_organizational_unit.suspended_ou.id
}

# Workloads ou outputs
output "workloads_ou_arn" {
  description = "Arn of the workloads ou."
  value       = aws_organizations_organizational_unit.workloads_ou.arn
}

output "workloads_ou_id" {
  description = "Id of the workloads ou."
  value       = aws_organizations_organizational_unit.workloads_ou.id
}
