output "ou_arn" {
  description = "ARN of the foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_ou.arn
}

output "ou_id" {
  description = "Identifier of the foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_ou.id
}
