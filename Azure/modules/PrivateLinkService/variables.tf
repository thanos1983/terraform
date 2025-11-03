variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "nat_ip_configuration_blocks" {
  description = "One or more (up to 8) nat_ip_configuration block as defined below."
  type = list(object({
    name                       = string
    subnet_id                  = string
    primary                    = string
    private_ip_address         = optional(string)
    private_ip_address_version = optional(string, "IPv4")
  }))
  default = []
}

variable "load_balancer_frontend_ip_configuration_ids" {
  description = "A list of Frontend IP Configuration IDs from a Standard Load Balancer, where traffic from the Private Link Service should be routed."
  type        = list(string)
}

variable "auto_approval_subscription_ids" {
  description = "A list of Subscription UUID/GUID's that will be automatically be able to use this Private Link Service."
  type        = list(string)
  default     = []
}

variable "enable_proxy_protocol" {
  description = "Should the Private Link Service support the Proxy Protocol? "
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_proxy_protocol)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "fqdns" {
  description = "List of FQDNs allowed for the Private Link Service."
  type        = list(string)
  default     = []
}

variable "visibility_subscription_ids" {
  description = "A list of Subscription UUID/GUID's that will be able to see this Private Link Service."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
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
