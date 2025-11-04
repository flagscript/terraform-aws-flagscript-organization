# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "org_owner" {
  default     = "flagscript"
  description = "Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "application_id" {
  default     = "flagscript-organization"
  description = "Application Id"
  type        = string
}

variable "budgets_limit_unit" {
  default     = "USD"
  description = "Limit unit to use for budgets."
  type        = string
}

variable "global_cost_budget_limit" {
  default     = "30"
  description = "Limit for the global cost budget."
  type        = string
}

variable "global_cost_budget_notification_emails" {
  default     = []
  description = "Email addresses to notifify the for global cost budget."
  type        = list(string)
}

variable "global_cost_budget_warning_threshold" {
  default     = 75
  description = "Threshold level to warn with a notification compared to limit."
  type        = number
}

variable "control_tower_deployed" {
  default     = false
  description = "Whether or not control tower will be deployed."
  type        = bool
}

variable "tags" {
  default     = {}
  description = "Additional tags to merge with every created resource in this module."
  type        = map(string)
}
