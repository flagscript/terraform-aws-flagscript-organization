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
