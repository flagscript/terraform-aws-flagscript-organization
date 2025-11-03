resource "aws_costoptimizationhub_enrollment_status" "flagscript_cost_optimization_hub" {
  include_member_accounts = true
}

resource "aws_costoptimizationhub_preferences" "flagscript_cost_optimization_hub_preferences" {
  member_account_discount_visibility = "All"
  savings_estimation_mode            = "BeforeDiscounts"
}
