variable "name" {
  description = "Specifies the name of the Logic App Changing this forces a new resource to be created."
  type        = string
}

variable "logic_app_id" {
  description = "Specifies the ID of the Logic App Workflow."
  type        = string
}

variable "body" {
  description = "Specifies the JSON Blob defining the Body of this Custom Trigger."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    update = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}
