# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "name" {
  description = "The name for the organizational unit."
  type        = string
}

variable "parent_id" {
  description = "ID of the parent organizational unit, which may be the root."
  type        = string
}
