resource "datadog_synthetics_test" "test_uptime" {
 # for_each = { for index, item in var.synthetics_config : index => item }
  for_each = { for item in var.synthetics_config : item.name => item }
  name      = "${var.project}-${var.environment}-${each.value.name}"
  type      = each.value.type
  subtype   = each.value.subtype
  status    = each.value.status
  message   = each.value.notification_channel
  locations = each.value.locations
  tags      = concat(["Account-AWS", var.project, var.environment], each.value.tags)

  request_definition {
    method = each.value.method
    url    = each.value.url
  }

  request_headers = {
    Content-Type = each.value.request_headers_content_type
  }

dynamic "assertion" {
    for_each = each.value.assertions
    content {
      type     = assertion.value.type
      operator = assertion.value.operator
      target   = assertion.value.target
    }
  }

  options_list {
    tick_every = each.value.tick_every
    retry {
      count    = each.value.retry_count
      interval = each.value.retry_interval
    }
    monitor_options {
      renotify_interval = each.value.monitor_renotify_interval
    }
  }
}