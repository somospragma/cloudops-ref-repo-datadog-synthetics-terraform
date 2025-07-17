#############################################################
#################### Variables Generales ####################
#############################################################

variable "project" {
  description = "Nombre del proyecto"
  type        = string
  default     = "Observability"
}

variable "environment" {
  description = "Ambiente de la carga de trabajo"
  type        = string
  default     = "Monitoring"
}

variable "client" {
  description = "Nombre del cliente propietario de la aplicación"
  type        = string
  default     = "Experian"

}

variable "datadog_api_key" {
  type      = string
  sensitive = true
  nullable  = false
  default   = "xxxxxxxxxxxxxxxxxxxxx"
}

variable "datadog_app_key" {
  type      = string
  sensitive = true
  nullable  = false
  default   = "xxxxcxcxcxcxcxcxcxcxcxcxcxcxcxcxc"
}

variable "datadog_api_url" {
  type      = string
  sensitive = true
  nullable  = false
  default   = "https://api.datadoghq.com/"
}

###########################################################################
#################### Variables Synthetics Browser Test ####################
###########################################################################

variable "synthetics_browser_config" {
  description = "List of Datadog Synthetic Browser Test configurations"
  type = list(object({
    name       = string
    type       = string
    status     = string
    message    = string
    device_ids = list(string)
    locations  = list(string)
    tags       = list(string)
    request_definition = object({
      method = string
      url    = string
    })
    browser_step = list(object({
      name = string
      type = string
      params = list(object({
        check = string
        value = string
      }))
    }))
    browser_variable = list(object({
      type    = string
      id = string
      name    = string
      pattern = string
      secure = bool
    }))
    options_list = object({
      tick_every = number
    })
  }))
}
