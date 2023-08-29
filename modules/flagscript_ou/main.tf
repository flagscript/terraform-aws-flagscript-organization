resource "aws_organizations_organizational_unit" "org_unit" {
  name      = var.name
  parent_id = var.parent_id
  tags = {
    "flagscript:environment" = "root"
    "flagscript:owner"       = "flagscript"
    "name"                   = var.name
    "terraform:module"       = "terraform-aws-flagscript-organization//flagscript_ou"
  }
}
