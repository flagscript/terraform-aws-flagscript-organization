# Foundational ou
locals {
  client_id_ou_name = join("-", tolist([for word in split("-", var.client_id) : title(word)]))
}

resource "aws_organizations_organizational_unit" "workload_ou" {
  name      = local.client_id_ou_name
  parent_id = var.workloads_ou_id
  tags = merge(
    local.common_tags,
    {
      "Name" = local.client_id_ou_name
    }
  )
}

# Founfational test/prod ous
resource "aws_organizations_organizational_unit" "workload_test_ou" {
  name      = "Test"
  parent_id = aws_organizations_organizational_unit.workload_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Test"
    }
  )
}

resource "aws_organizations_organizational_unit" "workload_prod_ou" {
  name      = "Prod"
  parent_id = aws_organizations_organizational_unit.workload_ou.id
  tags = merge(
    local.common_tags,
    {
      "Name" = "Prod"
    }
  )
}
