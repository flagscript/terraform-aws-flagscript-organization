resource "aws_budgets_budget" "global_cost_budget" {
  budget_type  = "COST"
  limit_amount = var.global_cost_budget_limit
  limit_unit   = var.budgets_limit_unit
  name         = "global-cost-budget"
  time_unit    = "MONTHLY"

  tags = {
    "Name" = "global-cost-budget"
  }

  cost_types {
    include_credit             = true
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.global_cost_budget_warning_threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.global_cost_budget_notification_emails
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.global_cost_budget_notification_emails
  }

}
