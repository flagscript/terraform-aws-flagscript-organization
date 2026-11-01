# Client workload test/prod ous
resource "aws_organizations_organizational_unit" "workload_test_ou" {
  name = local.client_id_ou_name
  parent_id = one([
    for ou in data.aws_organizations_organizational_units.workloads_ou.children :
    ou if ou.name == "Test"
  ])
  tags = merge(
    local.common_tags,
    {
      "Name" = local.client_id_ou_name
    }
  )
}

resource "aws_organizations_organizational_unit" "workload_prod_ou" {
  name = local.client_id_ou_name
  parent_id = one([
    for ou in data.aws_organizations_organizational_units.workloads_ou.children :
    ou if ou.name == "Prod"
  ])
  tags = merge(
    local.common_tags,
    {
      "Name" = local.client_id_ou_name
    }
  )
}
