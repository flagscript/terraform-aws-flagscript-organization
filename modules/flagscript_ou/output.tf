output "arn" {
  description = "ARN of the organizational unit."
  value       = aws_organizations_organizational_unit.org_unit.arn
}

output "id" {
  description = "Identifier of the organizational unit."
  value       = aws_organizations_organizational_unit.org_unit.id
}
