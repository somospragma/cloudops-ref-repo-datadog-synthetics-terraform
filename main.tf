#############################################################
#################### Monitors Module ########################

module "datadog_synthetics_browser" {
  source                    = "./modules/synthetics/browser"
  project                   = var.project
  environment               = var.environment
  datadog_app_key           = var.datadog_app_key
  datadog_api_key           = var.datadog_api_key
  datadog_api_url           = var.datadog_api_url
  client                    = var.client
  synthetics_browser_config = var.synthetics_browser_config
}
