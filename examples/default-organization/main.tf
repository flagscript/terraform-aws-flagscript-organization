module "flagscript_organization" {
  providers = {
    aws = aws.organization-administrator
  }
  source  = "flagscript/flagscript-organization/aws"
  version = "0.6.5"
}
