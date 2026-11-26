# Create account permissions boundary policy if a JSON document is provided
resource "aws_iam_policy" "account_boundary" {
  count       = local.create_account_permissions_boundary_policy ? 1 : 0
  description = "Recommended permissions boundary policy for IAM users and roles in this account."
  name        = "AccountPermissionsBoundaryPolicy"
  policy      = var.account_permissions_boundary_policy_json_document
  tags = merge(
    local.common_tags,
    {
      "Name" = "AccountPermissionsBoundaryPolicy"
    }
  )
}
