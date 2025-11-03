# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
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

variable "devops_group_id" {
  description = "Id of the devops iamic group."
  type        = string
}

variable "devops_permission_set_arn" {
  description = "Arn of the devops permission set."
  type        = string
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
variable "application_id" {
  default     = "flagscript-organization"
  description = "Application Id"
  type        = string
}

variable "close_on_deletion" {
  default     = true
  description = "If true, a deletion event will close the account. Otherwise, it will only remove from the organization."
  type        = bool
}
variable "deploy_default_flagscript_iam_identity_center_permissions" {
  default     = true
  description = "Whether or not to deploy flagscipt default permission sets."
  type        = bool
}

variable "iam_identity_center_region" {
  default     = "us-west-2"
  description = "Region where iam identity center is configured."
  type        = string
}

variable "iam_user_access_to_billing" {
  default     = "ALLOW"
  description = "If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions. If set to DENY, then only the root user (and no roles) of the new account can access account billing information."
  type        = string
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
