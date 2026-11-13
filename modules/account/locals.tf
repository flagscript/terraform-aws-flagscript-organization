locals {
  # Iam identity center
  identity_store_arn = tolist(data.aws_ssoadmin_instances.iam_identity_center_instances.arns)[0]
  identity_store_id  = tolist(data.aws_ssoadmin_instances.iam_identity_center_instances.identity_store_ids)[0]
  # Contact information
  billing_contact_info_provided    = var.billing_contact_info != null
  operations_contact_info_provided = var.operations_contact_info != null
  security_contact_info_provided   = var.security_contact_info != null
  billing_contact_info = {
    email = billing_contact_info_provided ? var.billing_contact_info.email : var.primary_contact_info.email
    name  = billing_contact_info_provided ? var.billing_contact_info.name : var.primary_contact_info.name
    phone = billing_contact_info_provided ? var.billing_contact_info.phone : var.primary_contact_info.phone
    title = billing_contact_info_provided ? var.billing_contact_info.title : var.primary_contact_info.title
  }
  operations_contact_info = {
    email = operations_contact_info_provided ? var.operations_contact_info.email : var.primary_contact_info.email
    name  = operations_contact_info_provided ? var.operations_contact_info.name : var.primary_contact_info.name
    phone = operations_contact_info_provided ? var.operations_contact_info.phone : var.primary_contact_info.phone
    title = operations_contact_info_provided ? var.operations_contact_info.title : var.primary_contact_info.title
  }
  security_contact_info = {
    email = security_contact_info_provided ? var.security_contact_info.email : var.primary_contact_info.email
    name  = security_contact_info_provided ? var.security_contact_info.name : var.primary_contact_info.name
    phone = security_contact_info_provided ? var.security_contact_info.phone : var.primary_contact_info.phone
    title = security_contact_info_provided ? var.security_contact_info.title : var.primary_contact_info.title
  }

  # tags
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
