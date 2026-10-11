resource "aws_verifiedaccess_instance_logging_configuration" "verifiedaccess_instance_logging_configurations" {
  for_each = var.verifiedaccess_instance_logging_configurations

  verifiedaccess_instance_id = each.value.verifiedaccess_instance_id
  region                     = each.value.region

  access_logs {
    dynamic "cloudwatch_logs" {
      for_each = each.value.access_logs.cloudwatch_logs != null ? [each.value.access_logs.cloudwatch_logs] : []
      content {
        enabled   = cloudwatch_logs.value.enabled
        log_group = cloudwatch_logs.value.log_group
      }
    }
    include_trust_context = each.value.access_logs.include_trust_context
    dynamic "kinesis_data_firehose" {
      for_each = each.value.access_logs.kinesis_data_firehose != null ? [each.value.access_logs.kinesis_data_firehose] : []
      content {
        delivery_stream = kinesis_data_firehose.value.delivery_stream
        enabled         = kinesis_data_firehose.value.enabled
      }
    }
    log_version = each.value.access_logs.log_version
    dynamic "s3" {
      for_each = each.value.access_logs.s3 != null ? [each.value.access_logs.s3] : []
      content {
        bucket_name  = s3.value.bucket_name
        bucket_owner = s3.value.bucket_owner
        enabled      = s3.value.enabled
        prefix       = s3.value.prefix
      }
    }
  }
}

