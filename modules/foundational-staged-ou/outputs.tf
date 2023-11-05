output "ou_arn" {
  description = "ARN of the foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_ou.arn
}

output "ou_id" {
  description = "Identifier of the foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_ou.id
}

output "test_ou_arn" {
  description = "ARN of the test foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_test_ou.arn
}

output "test_ou_id" {
  description = "Identifier of the test foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_test_ou.id
}

output "prod_ou_arn" {
  description = "ARN of the production foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_prod_ou.arn
}

output "prod_ou_id" {
  description = "Identifier of the production foundational organizational unit."
  value       = aws_organizations_organizational_unit.foundational_prod_ou.id
}
