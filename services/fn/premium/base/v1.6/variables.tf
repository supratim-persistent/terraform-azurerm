variable "context" {
  type = object({

    application_name            = string
    environment_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({

    name                      = string
    runtime_version           = string
    runtime_type              = string
    app_settings              = map(string)
    plan_id                   = string
    storage_account = object({
        connection_string = string
        name = string
        access_key = string
    })

  })
}
variable "observability_settings" {
  type = object({
    instrumentation_key       = string
    workspace_id              = string
  })
}
variable "ip_rules_settings" {
    type = object({
    user_defined_iplist       = list(string)
    apim_iplist               = list(string)
    services_iplist           = map(list(string)
    })
    default = {
     {
       user_defined_iplist = []
       apim_iplist         = []
       services_iplist     = {
                         "us-east" = ["20.42.2.0/23", "20.42.4.0/26", "20.42.64.0/28", "20.49.111.0/29", "40.71.14.32/28", "40.78.229.96/28"]
                         "us-west" = ["13.86.219.208/28", "40.82.249.64/26", "40.82.250.0/23", "52.250.228.0/29"]
                        }
                 }
          }
}
