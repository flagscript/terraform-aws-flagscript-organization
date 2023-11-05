# Foundational ou
resource "aws_organizations_organizational_unit" "foundational_ou" {
  name      = var.name
  parent_id = var.parent_id
  tags = merge(
    local.common_tags,
    {
      "Name" = var.name
    }
  )
}

# Founfational test/prod ous
resource "aws_organizations_organizational_unit" "foundational_test_ou" {
  name      = "Test"
  parent_id = aws_organizations_organizational_unit.foundational_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Test"
    }
  )
}

resource "aws_organizations_organizational_unit" "foundational_prod_ou" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.foundational_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Prod"
    }
  )
}
