# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "app_name" {
  description = "The name for the flgscript application."
  type        = string
}

variable "workloads_ou_id" {
  description = "ID of the flagscript workloads ou id."
  type        = string
}
