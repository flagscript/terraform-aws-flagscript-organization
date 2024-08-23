# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "name" {
  description = "The name for the aws account."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "install_github_openid_profider" {
  default     = false
  description = "Whether or not to install the github oidc provider. Currently for flagscript, this is only for accounts where github is pushing s3 content."
  type        = bool
}

variable "openid_provider_name" {
  default     = "FlagscriptGitHibOpenIdProvider"
  description = "Name of the github openid provider."
  type        = string
}
