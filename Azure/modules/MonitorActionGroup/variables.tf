variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "short_name" {
  description = "The short name of the action group. This will be used in SMS messages."
  type        = string
}

variable "enabled" {
  description = "Whether this action group is enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "arm_role_receiver_blocks" {
  description = "One or more arm_role_receiver blocks as defined below."
  type = list(object({
    name                    = string
    role_id                 = string
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "automation_runbook_receiver_blocks" {
  description = "One or more automation_runbook_receiver blocks as defined below."
  type = list(object({
    name                    = string
    automation_account_id   = string
    runbook_name            = string
    webhook_resource_id     = string
    is_global_runbook       = bool
    service_uri             = string
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "azure_app_push_receiver_blocks" {
  description = "One or more azure_app_push_receiver blocks as defined below."
  type = list(object({
    name          = string
    email_address = string
  }))
  default = []
}

variable "azure_function_receiver_blocks" {
  description = "One or more azure_app_push_receiver blocks as defined below."
  type = list(object({
    name                     = string
    function_app_resource_id = string
    function_name            = string
    http_trigger_url         = string
    use_common_alert_schema  = optional(bool)
  }))
  default = []
}

variable "email_receiver_blocks" {
  description = "One or more email_receiver blocks as defined below."
  type = list(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "event_hub_receiver_blocks" {
  description = "One or more event_hub_receiver blocks as defined below."
  type = list(object({
    name                    = string
    event_hub_id            = optional(string)
    event_hub_name          = optional(string)
    event_hub_namespace     = optional(string)
    subscription_id         = optional(string)
    tenant_id               = optional(string)
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "itsm_receiver_blocks" {
  description = "One or more itsm_receiver blocks as defined below."
  type = list(object({
    name                 = string
    workspace_id         = string
    connection_id        = string
    ticket_configuration = string
    region               = string
  }))
  default = []
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
  default     = "global"
}

variable "logic_app_receiver_blocks" {
  description = "One or more logic_app_receiver blocks as defined below."
  type = list(object({
    name                    = string
    resource_id             = string
    callback_url            = string
    use_common_alert_schema = optional(bool)
  }))
  default = []
}

variable "sms_receiver_blocks" {
  description = "One or more sms_receiver blocks as defined below."
  type = list(object({
    name         = string
    country_code = string
    phone_number = string
  }))
  default = []
}

variable "webhook_receiver_blocks" {
  description = "One or more webhook_receiver blocks as defined below."
  type = list(object({
    name                    = string
    service_uri             = string
    use_common_alert_schema = optional(bool)
    aad_auth_block = optional(object({
      object_id      = string
      identifier_uri = optional(string)
      tenant_id      = optional(string)
    }))
  }))
  default = []
}

variable "voice_receiver_blocks" {
  description = "One or more sms_receiver blocks as defined below."
  type = list(object({
    name         = string
    country_code = string
    phone_number = string
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}