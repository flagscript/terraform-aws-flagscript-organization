# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "application_id" {
  description = "Application Id"
  type        = string
}

variable "client_id" {
  description = "The id for the client."
  type        = string
}

variable "name" {
  description = "The name for the aws account."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "org_owner" {
  default     = "flagscript"
  description = "Owner moniker for the flagscript organization."
  type        = string
}
