#######################################################################
################### Datadog Synthetics Browser Test ###################
#######################################################################

resource "datadog_synthetics_test" "browser_test" {
  for_each = { for item in var.synthetics_browser_config : item.name => item }
  name     = "${var.client}-${var.project}-${var.environment}-${each.value.name}"
  type     = each.value.type
  status   = each.value.status
  #message    = each.value.notification_channel
  device_ids = ["laptop_large"]
  locations  = each.value.locations
  tags       = concat([var.project, var.environment], each.value.tags)

  request_definition {
    method = each.value.request_definition.method
    url    = each.value.request_definition.url
  }

  dynamic "browser_step" {
    for_each = each.value.browser_step
    content {
      name = browser_step.value.name
      type = browser_step.value.type

      dynamic "params" {
        for_each = browser_step.value.params
        content {
          check = params.value.check
          value = params.value.value
        }
      }
    }
  }

  dynamic "browser_variable" {
    for_each = each.value.browser_variable
    content {
      type    = browser_variable.value.type
      id      = browser_variable.value.id
      name    = browser_variable.value.name
      pattern = browser_variable.value.pattern
      secure  = browser_variable.value.secure
    }
  }

  options_list {
    tick_every = each.value.options_list.tick_every
  }
}
