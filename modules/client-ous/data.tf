# Retrieve Workloads OU
data "aws_organizations_organizational_units" "workloads_ou" {
  parent_id = var.workloads_ou_id
}
