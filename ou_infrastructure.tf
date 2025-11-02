# Create the infrastructure ous
## Infrastructure ou
resource "aws_organizations_organizational_unit" "infrastructure_ou" {
  name      = "Infrastructure"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Infrastructure"
    }
  )
}

## Infrastructure test ou
resource "aws_organizations_organizational_unit" "infrastructure_test_ou" {
  name      = "Test"
  parent_id = aws_organizations_organizational_unit.infrastructure_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Test"
    }
  )
}

## Infrastructure prod ou
resource "aws_organizations_organizational_unit" "infrastructure_prod_ou" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.infrastructure_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Prod"
    }
  )
}
