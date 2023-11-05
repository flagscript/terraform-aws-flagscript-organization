output "ou_arn" {
  description = "ARN of the client workload organizational unit."
  value       = aws_organizations_organizational_unit.workload_ou.arn
}

output "ou_id" {
  description = "Identifier of the client workload organizational unit."
  value       = aws_organizations_organizational_unit.workload_ou.id
}

output "test_ou_arn" {
  description = "ARN of the test client workload test organizational unit."
  value       = aws_organizations_organizational_unit.workload_test_ou.arn
}

output "test_ou_id" {
  description = "Identifier of the test client workload test organizational unit."
  value       = aws_organizations_organizational_unit.workload_test_ou.id
}

output "prod_ou_arn" {
  description = "ARN of the production client workload production organizational unit."
  value       = aws_organizations_organizational_unit.workload_prod_ou.arn
}

output "prod_ou_id" {
  description = "Identifier of the production client workload production organizational unit."
  value       = aws_organizations_organizational_unit.workload_prod_ou.id
}
