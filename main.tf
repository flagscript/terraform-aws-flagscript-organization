# Create the organization
resource "aws_organizations_organization" "flagscript_org" {
  aws_service_access_principals = var.allowed_service_principals
  enabled_policy_types          = var.enabled_policy_types
  feature_set                   = var.feature_set
}

locals {
  flagscript_root_id = aws_organizations_organization.flagscript_org.roots[0].id
}

# Create the core ous
## infrastructure ou
module "core_infrastructure_ou" {
  source    = "./modules/flagscript_ou"
  name      = "infrastructure"
  parent_id = local.flagscript_root_id
}

## security ou
module "core_security_ou" {
  source    = "./modules/flagscript_ou"
  name      = "security"
  parent_id = local.flagscript_root_id
}


## Workloads ou
module "core_workloads_ou" {
  source    = "./modules/flagscript_ou"
  name      = "workloads"
  parent_id = local.flagscript_root_id
}

# Create flagscript owner workload.
module "flagscript_owner" {
  source          = "./modules/flagscript_org_owner"
  app_name        = "flagscript"
  workloads_ou_id = module.core_workloads_ou.id
}
