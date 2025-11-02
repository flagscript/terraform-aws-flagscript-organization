# Create the deployments ous
## Deployments ou
resource "aws_organizations_organizational_unit" "deployments_ou" {
  name      = "Deployments"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Deployments"
    }
  )
}

## Deployments test ou
resource "aws_organizations_organizational_unit" "deployments_test_ou" {
  name      = "Test"
  parent_id = aws_organizations_organizational_unit.deployments_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Test"
    }
  )
}

## Deployments prod ou
resource "aws_organizations_organizational_unit" "deployments_prod_ou" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.deployments_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Prod"
    }
  )
}
