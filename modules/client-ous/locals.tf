locals {
  common_tags = merge(
    {
      "flagscript:account-owner:owner"            = var.org_owner
      "flagscript:automation:environment"         = "root"
      "flagscript:cost-allocation:application-id" = var.application_id
      "flagscript:cost-allocation:owner"          = var.client_id
      "flagscript:data-owner:owner"               = var.org_owner
      "flagscript:operations:owner"               = var.org_owner
      "teraform:module:repository"                = "https://github.com/flagscript/terraform-aws-flagscript-organization"
      "terraform:module"                          = "terraform-aws-flagscript-organization//client-ous"
    },
    var.tags
  )
}
