# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "application_id" {
  default     = "control-tower"
  description = "Application Id"
  type        = string
}

variable "control_tower_home_region" {
  default     = "us-west-2"
  description = "Home region of control tower."
  type        = string
}

variable "deletion_window_in_days" {
  default     = 30
  description = "The waiting period, specified in number of days."
  type        = number
}

variable "enable_key" {
  default     = true
  description = "Specifies whether the key is enabled."
  type        = bool
}


variable "enable_key_rotation" {
  default     = false
  description = "Specifies whether key rotation is enabled."
  type        = bool
}


variable "org_owner" {
  default     = "flagscript"
  description = "Owner moniker for the flagscript organization. This is your owner id for your enthusiast organization."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Additional tags to merge with every created resource in this module."
  type        = map(string)
}
