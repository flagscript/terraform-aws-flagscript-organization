locals {

  current_account_id = data.aws_caller_identity.current.account_id
  current_partition  = data.aws_partition.current.partition
  key_name           = "control-tower-kms-key"

  common_tags = merge(
    {
      "flagscript:automation:environment"         = "root"
      "flagscript:cost-allocation:application-id" = var.application_id
      "flagscript:cost-allocation:owner"          = var.org_owner
      "flagscript:data-owner:owner"               = var.org_owner
      "flagscript:operations:owner"               = var.org_owner
      "teraform:module:repository"                = "https://github.com/flagscript/terraform-aws-flagscript-organization"
      "terraform:module"                          = "terraform-aws-flagscript-organization//control-tower-kms-key"
    },
    var.tags
  )

}
