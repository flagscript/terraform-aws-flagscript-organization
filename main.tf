# Create the organization
resource "aws_organizations_organization" "flagscript_org" {
  aws_service_access_principals = var.allowed_service_principals
  enabled_policy_types          = var.enabled_policy_types
  feature_set                   = var.feature_set
}

locals {
  flagscript_root_id = aws_organizations_organization.flagscript_org.roots[0].id
}

# Create the foundational ous
## Deployments ou
module "deployments_ou" {
  source         = "./modules/foundational-staged-ou"
  application_id = var.application_id
  name           = "Deployments"
  parent_id      = local.flagscript_root_id
}

## Infrastructure ou
module "infrastructure_ou" {
  source         = "./modules/foundational-staged-ou"
  application_id = var.application_id
  name           = "Infrastructure"
  parent_id      = local.flagscript_root_id
}

## Security ou
module "security_ou" {
  source         = "./modules/foundational-staged-ou"
  application_id = var.application_id
  name           = "Security"
  parent_id      = local.flagscript_root_id
}

## Suspended ou
module "suspended_ou" {
  source         = "./modules/foundational-ou"
  application_id = var.application_id
  name           = "Suspended"
  parent_id      = local.flagscript_root_id
}

## Workloads ou
module "workloads_ou" {
  source         = "./modules/foundational-ou"
  application_id = var.application_id
  name           = "Workloads"
  parent_id      = local.flagscript_root_id
}
