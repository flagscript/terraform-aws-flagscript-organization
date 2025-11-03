resource "aws_ssoadmin_account_assignment" "devops_permission_set_assignment" {
  instance_arn       = local.identity_store_arn
  permission_set_arn = var.devops_permission_set_arn
  principal_id       = var.devops_group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.flagscript_account.id
  target_type        = "AWS_ACCOUNT"
}

# iam identity center assignments
# administrator
resource "aws_ssoadmin_account_assignment" "cloud_administrator_administrator_set_assignment" {
  count              = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
  instance_arn       = local.identity_store_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.administator_permission_set[0].arn
  principal_id       = data.aws_identitystore_group.cloud_administrator_group[0].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.flagscript_account.id
  target_type        = "AWS_ACCOUNT"
}

# security auditor
resource "aws_ssoadmin_account_assignment" "security_auditor_security_auditor_set_assignment" {
  count              = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
  instance_arn       = local.identity_store_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.security_auditor_permission_set[0].arn
  principal_id       = data.aws_identitystore_group.security_auditor_group[0].group_id
  principal_type     = "GROUP"
  target_id          = aws_organizations_account.flagscript_account.id
  target_type        = "AWS_ACCOUNT"
}
