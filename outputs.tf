##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "bucket_name" {
  value = module.this.name
}

output "bucket_url" {
  value = module.this.url
}

output "apphub_service_uri" {
  value = module.this.apphub_service_uri
}