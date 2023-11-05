# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "application_id" {
  description = "Application Id"
  type        = string
}

variable "name" {
  description = "The name for the organizational unit."
  type        = string
}

variable "parent_id" {
  description = "ID of the parent organizational unit, which may be the root."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "org_owner" {
  default     = "flagscript"
  description = "Owner moniker for the flagscript organization."
  type        = string
}
