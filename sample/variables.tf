#################### Variables Datadog ####################
variable "datadog_api_key" {
  type      = string
}

variable "datadog_app_key" {
  type      = string
}

variable "datadog_api_url" {
  type      = string
}

variable "datadog_notification_channel" {
  type = string
}

#################### Variables Synthetics ####################
variable "synthetics_config" {
  description = "List of Datadog Synthetic Test configurations"
  type = list(object({
    name                     = string
    url                      = string
    type                     = string
    subtype                  = string
    status                   = string
    notification_channel     = string
    locations                = list(string)
    tags                     = list(string)
    method                   = string
    request_headers_content_type = string
    assertions               = list(object({
      type     = string
      operator = string
      target   = string
    }))
    tick_every               = number
    retry_count              = number
    retry_interval           = number
    monitor_renotify_interval = number
  }))
}

#################### Variables AWS ####################

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente de la carga de trabajo"
  type        = string
}