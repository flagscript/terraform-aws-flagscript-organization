locals {
  # Resources
  create_account_permissions_boundary_policy = var.account_permissions_boundary_policy_json_document != null
  # Tagging
  common_tags = merge(
    {
      "terraform:module:repository" = "https://github.com/flagscript/terraform-aws-flagscript-organization"
      "terraform:module"            = "terraform-aws-flagscript-organization//account-setup"
    },
    var.tags
  )
}
