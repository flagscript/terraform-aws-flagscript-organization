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

variable "contact_info" {
  description = "Contact information for the account."
  type = object({
    address      = string
    city         = string
    company      = string
    country_code = string
    county       = string
    email        = string
    name         = string
    phone        = string
    postal_code  = string
    state        = string
    title        = string
    website      = string
  })
}

variable "email" {
  description = "The email address of the account."
  type        = string
}

variable "name" {
  description = "The name for the aws account."
  type        = string
}

variable "parent_id" {
  description = "ID of the parent organizational unit."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "org_owner" {
  default     = "flagscript"
  description = "Owner moniker for the flagscript organization."
  type        = string
}
