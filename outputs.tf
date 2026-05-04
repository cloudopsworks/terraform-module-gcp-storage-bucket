##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "bucket_name" {
  description = "Resolved Google Cloud Storage bucket name created by the module"
  value       = module.this.name
}

output "bucket_url" {
  description = "URL of the Google Cloud Storage bucket"
  value       = module.this.url
}

output "apphub_service_uri" {
  description = "AppHub service URI exported by the underlying storage module, when available"
  value       = module.this.apphub_service_uri
}