# Organization outputs
output "org_arn" {
  description = "Arn of the flagscript organization."
  value       = aws_organizations_organization.flagscript_org.arn
}

output "org_id" {
  description = "Id of the flagscript organization."
  value       = aws_organizations_organization.flagscript_org.id
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

output "networking_ou_arn" {
  description = "Arn of the networking ou."
  value       = aws_organizations_organizational_unit.networking_ou.arn
}

output "networking_ou_id" {
  description = "Id of the networking ou."
  value       = aws_organizations_organizational_unit.networking_ou.id
}
