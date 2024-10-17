variable "subnet_id" {
  description = "The ID of the Subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group which should be attached to the Network Interface."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}