# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "application_id" {
  description = "Application Id"
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "allowed_service_principals" {
  default     = []
  description = "List of AWS service principal names for which you want to enable integration with your organization."
  type        = list(string)
}

variable "enabled_policy_types" {
  default = [
    "AISERVICES_OPT_OUT_POLICY",
    "BACKUP_POLICY",
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
  description = "List of Organizations policy types to enable in the Organization Root."
  type        = list(string)
}

variable "feature_set" {
  default     = "ALL"
  description = "Specify 'ALL' (default) or 'CONSOLIDATED_BILLING'."
  type        = string
  validation {
    condition     = can(regex("^(ALL|CONSOLIDATED_BILLING)$", var.feature_set))
    error_message = "Variable feature_set must be ALL or CONSOLIDATED_BILLING."
  }
}

variable "org_owner" {
  default     = "flagscript"
  description = "Owner moniker for the flagscript organization."
  type        = string
}
