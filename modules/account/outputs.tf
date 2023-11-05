output "arn" {
  description = "The ARN for this account."
  value       = aws_organizations_account.flagscript_account.arn
}

output "id" {
  description = "The AWS account id."
  value       = aws_organizations_account.flagscript_account.id
}
