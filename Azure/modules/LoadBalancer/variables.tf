variable "name" {
  description = "Specifies the name of the Load Balancer"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Load Balancer."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the Load Balancer resource should be created."
  type        = string
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Load Balancer should exist."
  type        = string
  default     = null
}

variable "frontend_ip_configuration_blocks" {
  description = "The frontend_ip_configuration block(s) supports the following."
  type = list(object({
    name = string
    zones = optional(list(string))
    subnet_id = optional(string)
    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    private_ip_address = optional(string)
    private_ip_address_allocation = optional(string)
    private_ip_address_version = optional(string)
    public_ip_address_id = optional(string)
    public_ip_prefix_id = optional(string)
  }))
}

variable "sku" {
  description = "The SKU of the Azure Load Balancer."
  type        = string
  validation {
    condition = contains(["Basic", "Standard", "Gateway"], title(var.sku))
    error_message = "Sku name must be \"Basic\", \"Standard\" or \"Gateway\"."
  }
  default = "Basic"
}

variable "sku_tier" {
  description = "The SKU tier of this Load Balancer."
  type        = string
  validation {
    condition = contains(["Global", "Regional"], title(var.sku_tier))
    error_message = "Sku name must be \"Basic\" or \"Regional\"."
  }
  default = "Regional"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}