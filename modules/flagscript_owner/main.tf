# Create the app ou
module "app_ou" {
  source    = "../modules/flagscript_ou"
  name      = var.app_name
  parent_id = var.workloads_ou_id
}

# Create the workload stage ous 
## dev ou
module "dev_ou" {
  source    = "../modules/flagscript_ou"
  name      = "dev"
  parent_id = module.app_ou.id
}

## test ou
module "test_ou" {
  source    = "../modules/flagscript_ou"
  name      = "test"
  parent_id = module.app_ou.id
}

## prod ou
module "prod_ou" {
  source    = "../modules/flagscript_ou"
  name      = "prod"
  parent_id = module.app_ou.id
}
