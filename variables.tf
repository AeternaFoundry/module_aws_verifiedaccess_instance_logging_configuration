variable "verifiedaccess_instance_logging_configurations" {
  description = <<EOT
Map of verifiedaccess_instance_logging_configurations, attributes below
Required:
    - verifiedaccess_instance_id
    - access_logs (block):
        - cloudwatch_logs (optional, block):
            - enabled (required)
            - log_group (optional)
        - include_trust_context (optional)
        - kinesis_data_firehose (optional, block):
            - delivery_stream (optional)
            - enabled (required)
        - log_version (optional)
        - s3 (optional, block):
            - bucket_name (optional)
            - bucket_owner (optional)
            - enabled (required)
            - prefix (optional)
Optional:
    - region
EOT

  type = map(object({
    verifiedaccess_instance_id = string
    region                     = optional(string)
    access_logs = object({
      cloudwatch_logs = optional(object({
        enabled   = bool
        log_group = optional(string)
      }))
      include_trust_context = optional(bool)
      kinesis_data_firehose = optional(object({
        delivery_stream = optional(string)
        enabled         = bool
      }))
      log_version = optional(string)
      s3 = optional(object({
        bucket_name  = optional(string)
        bucket_owner = optional(string)
        enabled      = bool
        prefix       = optional(string)
      }))
    })
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

