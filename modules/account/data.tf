# Lookup the identity store id and arn.
data "aws_ssoadmin_instances" "iam_identity_center_instances" {
  region = var.iam_identity_center_region
}

# IAM Identity Center Groups
## cloud-administrator group
data "aws_identitystore_group" "cloud_administrator_group" {
  count             = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
  region            = var.iam_identity_center_region
  identity_store_id = local.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "DisplayName"
      attribute_value = "cloud-administator"
    }
  }
}

## read-only group
# data "aws_identitystore_group" "read_only_group" {
#   count             = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
#   region            = var.iam_identity_center_region
#   identity_store_id = local.identity_store_id

#   alternate_identifier {
#     unique_attribute {
#       attribute_path  = "DisplayName"
#       attribute_value = "read-only"
#     }
#   }
# }

## security auditor group
data "aws_identitystore_group" "security_auditor_group" {
  count             = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
  region            = var.iam_identity_center_region
  identity_store_id = local.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "DisplayName"
      attribute_value = "security-auditor"
    }
  }
}

#######################################
# IAM Identity Center Permission Sets #
#######################################
data "aws_ssoadmin_permission_set" "administator_permission_set" {
  count        = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
  region       = var.iam_identity_center_region
  instance_arn = local.identity_store_id
  name         = "administrator"
}

# data "aws_ssoadmin_permission_set" "read_only_access_permission_set" {
#   count        = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
#   region       = var.iam_identity_center_region
#   instance_arn = local.identity_store_id
#   name         = "read-only"
# }

data "aws_ssoadmin_permission_set" "security_auditor_permission_set" {
  count        = var.deploy_default_flagscript_iam_identity_center_permissions ? 1 : 0
  region       = var.iam_identity_center_region
  instance_arn = local.identity_store_id
  name         = "security-auditor"
}
