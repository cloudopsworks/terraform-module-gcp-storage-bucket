##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
variable "name" {
  description = "Reserved explicit name input; the current module naming path derives names from prefix and shared environment metadata"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Prefix used to compose the Google Cloud Storage bucket name"
  type        = string
  default     = ""
}

variable "random_bucket_suffix" {
  description = "Reserved suffix toggle; the current implementation still enables the upstream random bucket suffix"
  type        = bool
  default     = true
}

variable "short_system_name" {
  description = "Force the use of the short system name local variable, defaults to false."
  type        = bool
  default     = false
}

variable "bucket_config" {
  description = "Configuration values passed through to the underlying Google Cloud Storage bucket module"
  type        = any
  default     = {}
}
