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

variable "tags" {
  default     = {}
  description = "Additional tags to merge with every created resource in this module."
  type        = map(string)
}
