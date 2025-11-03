# Create various foundational ous
## AFT ou
resource "aws_organizations_organizational_unit" "aft_ou" {
  name      = "AFT"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "AFT"
    }
  )
}

## Sandbox ou
resource "aws_organizations_organizational_unit" "sandbox_ou" {
  name      = "Sandbox"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Sandbox"
    }
  )
}

## Suspended ou
resource "aws_organizations_organizational_unit" "suspended_ou" {
  name      = "Suspended"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Suspended"
    }
  )
}

## Transitional ou
resource "aws_organizations_organizational_unit" "transitional_ou" {
  name      = "Transitional"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Transitional"
    }
  )
}
