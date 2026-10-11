output "verifiedaccess_instance_logging_configurations_id" {
  description = "Map of id values across all verifiedaccess_instance_logging_configurations, keyed the same as var.verifiedaccess_instance_logging_configurations"
  value       = { for k, v in aws_verifiedaccess_instance_logging_configuration.verifiedaccess_instance_logging_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "verifiedaccess_instance_logging_configurations_access_logs" {
  description = "Map of access_logs values across all verifiedaccess_instance_logging_configurations, keyed the same as var.verifiedaccess_instance_logging_configurations"
  value       = { for k, v in aws_verifiedaccess_instance_logging_configuration.verifiedaccess_instance_logging_configurations : k => one(v.access_logs) if v.access_logs != null && length(v.access_logs) > 0 }
}
output "verifiedaccess_instance_logging_configurations_region" {
  description = "Map of region values across all verifiedaccess_instance_logging_configurations, keyed the same as var.verifiedaccess_instance_logging_configurations"
  value       = { for k, v in aws_verifiedaccess_instance_logging_configuration.verifiedaccess_instance_logging_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "verifiedaccess_instance_logging_configurations_verifiedaccess_instance_id" {
  description = "Map of verifiedaccess_instance_id values across all verifiedaccess_instance_logging_configurations, keyed the same as var.verifiedaccess_instance_logging_configurations"
  value       = { for k, v in aws_verifiedaccess_instance_logging_configuration.verifiedaccess_instance_logging_configurations : k => v.verifiedaccess_instance_id if v.verifiedaccess_instance_id != null && length(v.verifiedaccess_instance_id) > 0 }
}

