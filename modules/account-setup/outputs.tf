# Iam
output "account_permissions_boundary_policy_arn" {
  description = "Arn of the account permissions boundary policy."
  value       = one(aws_iam_policy.account_boundary[*].arn)
}

output "account_permissions_boundary_policy_name" {
  description = "Name of the account permissions boundary policy."
  value       = one(aws_iam_policy.account_boundary[*].name)
}
