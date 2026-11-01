# Add flagscript cost allocation tags
resource "aws_ce_cost_allocation_tag" "this" {
  for_each = toset(
    [
      "flagscript:cost-allocation:application-id",
      "flagscript:cost-allocation:owner",
    ]
  )
  tag_key = each.key
  status  = "Active"
}
