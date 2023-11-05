locals {
  common_tags = {
    "flagscript:account-owner:owner"            = var.org_owner
    "flagscript:automation:environment"         = "root"
    "flagscript:cost-allocation:application-id" = var.application_id
    "flagscript:cost-allocation:owner"          = var.org_owner
    "flagscript:data-owner:owner"               = var.org_owner
    "flagscript:operations:owner"               = var.org_owner
    "github:module:repository"                  = "flagscript/terraform-aws-flagscript-organization"
    "terraform:module"                          = "terraform-aws-flagscript-organization"
  }
}
