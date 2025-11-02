# Create the security ous
## Security ou
resource "aws_organizations_organizational_unit" "security_ou" {
  name      = "Security"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Security"
    }
  )
}

## Security test ou
resource "aws_organizations_organizational_unit" "security_test_ou" {
  name      = "Test"
  parent_id = aws_organizations_organizational_unit.security_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Test"
    }
  )
}

# #Security prod ou
resource "aws_organizations_organizational_unit" "security_prod_ou" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.security_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Prod"
    }
  )
}
