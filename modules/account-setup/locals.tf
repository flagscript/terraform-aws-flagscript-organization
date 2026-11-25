locals {
  common_tags = merge(
    {
      "terraform:module:repository" = "flagscript/terraform-aws-flagscript-organization"
      "terraform:module"            = "terraform-aws-flagscript-organization//account-setup"
    },
    var.tags
  )
}
