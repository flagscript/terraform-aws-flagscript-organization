# Create the workloads ous
## Workloads ou
resource "aws_organizations_organizational_unit" "workloads_ou" {
  name      = "Workloads"
  parent_id = local.flagscript_root_id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Workloads"
    }
  )
}

## Workloads test ou
resource "aws_organizations_organizational_unit" "workloads_test_ou" {
  name      = "Test"
  parent_id = aws_organizations_organizational_unit.workloads_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Test"
    }
  )
}

## Workloads prod ou
resource "aws_organizations_organizational_unit" "workloads_prod_ou" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.workloads_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Prod"
    }
  )
}
