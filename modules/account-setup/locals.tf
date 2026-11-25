locals {
  common_tags = merge(
    {
      "terraform:module:repository" = "https://github.com/flagscript/terraform-aws-flagscript-organization"
      "terraform:module"            = "terraform-aws-flagscript-organization//account-setup"
    },
    var.tags
  )
}
