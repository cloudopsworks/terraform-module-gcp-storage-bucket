##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
locals {
  clean_name  = var.name != "" ? var.name : (var.short_system_name == true ? "${var.name_prefix}-${local.system_name_short}" : "${var.name_prefix}-${local.system_name}")
  bucket_name = var.random_bucket_suffix == false ? local.clean_name : "${local.clean_name}-${random_string.random[0].result}"
  bucket_suffix = var.short_system_name == true ? local.system_name_short : local.system_name
}

resource "random_string" "random" {
  count   = var.random_bucket_suffix ? 1 : 0
  length  = 8
  special = false
  lower   = true
  upper   = false
  numeric = true
}

module "this" {
  source                   = "terraform-google-modules/cloud-storage/google"
  version                  = "~> 12.0"
  names                    = [local.bucket_suffix]
  prefix                   = var.name_prefix
  project_id               = try(var.bucket_config.project_id, data.google_project.current.project_id)
  bucket_lifecycle_rules   = length(try(var.bucket_config.lifecycle_rule, [])) > 0 ? { "${bucket_suffix}" = var.bucket_config.lifecycle_rule } : {}
  admins                   = try(var.bucket_config.admins, [])
  viewers                  = try(var.bucket_config.bucket_viewers, [])
  location                 = try(var.bucket_config.location, "US")
  labels                   = merge(try(var.bucket_config.labels, {}), {for k, v in local.all_tags: lower(k) => replace(lower(v), "/[ //@#$+=.]/", "_")})
  public_access_prevention = try(var.bucket_config.public_access_prevention, "enforced")
  retention_policy         = try(var.bucket_config.retention_policy, {})
  storage_class            = try(var.bucket_config.storage_class, "STANDARD")
  randomize_suffix         = true
  versioning               = try(var.bucket_config.versioning, false) ? { "${bucket_suffix}" = true } : {}
}