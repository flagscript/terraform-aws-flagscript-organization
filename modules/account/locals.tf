locals {
  identity_store_arn = tolist(data.aws_ssoadmin_instances.iam_identity_center_instances.arns)[0]
  identity_store_id  = tolist(data.aws_ssoadmin_instances.iam_identity_center_instances.identity_store_ids)[0]
  common_tags = merge(
    {
      "flagscript:account-owner:owner"            = var.client_id
      "flagscript:automation:environment"         = "root"
      "flagscript:cost-allocation:application-id" = var.application_id
      "flagscript:cost-allocation:owner"          = var.client_id
      "flagscript:data-owner:owner"               = var.client_id
      "flagscript:operations:owner"               = var.org_owner
      "teraform:module:repository"                = "https://github.com/flagscript/terraform-aws-flagscript-organization"
      "terraform:module"                          = "terraform-aws-flagscript-organization//account"
    },
    var.tags
  )
}
