resource "aws_ssoadmin_account_assignment" "devops_permission_set_assignment" {
  instance_arn       = var.identity_store_arn
  permission_set_arn = var.devops_permission_set_arn
  principal_id       = var.devops_group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.flagscript_account.id
  target_type        = "AWS_ACCOUNT"
}
