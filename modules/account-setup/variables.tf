# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "name" {
  description = "The name for the aws account."
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "install_github_openid_provider" {
  default     = false
  description = "Whether or not to install a github oidc provider for the account."
  type        = bool
}

variable "token_version_preference" {
  default     = "v1Token"
  description = "The global endpoint token version preference for the account."
  type        = string

  validation {
    condition     = contains(["v1Token", "v2Token"], var.token_version_preference)
    error_message = "token_version_preference must be either 'v1Token' or 'v2Token'."
  }
}

variable "tags" {
  default     = {}
  description = "Additional tags to merge with every created resource in this module."
  type        = map(string)
}
