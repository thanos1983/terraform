variable "name" {
  description = "Specifies the name of the Logic App Changing this forces a new resource to be created. "
  type        = string
}

variable "logic_app_id" {
  description = "Specifies the ID of the Logic App Workflow."
  type        = string
}

variable "method" {
  description = "Specifies the HTTP Method which the request be using."
  type        = string
  default     = null
}

variable "uri" {
  description = "Specifies the URI which will be called when this HTTP Action is triggered."
  type        = string
}

variable "body" {
  description = "Specifies the HTTP Body that should be sent to the uri when this HTTP Action is triggered."
  type        = string
  default     = null
}

variable "headers" {
  description = "Specifies a Map of Key-Value Pairs that should be sent to the uri when this HTTP Action is triggered."
  type        = map(string)
  default     = null
}

variable "queries" {
  description = "Specifies a Map of Key-Value Pairs that should be sent to the uri when this HTTP Action is triggered."
  type        = map(string)
  default     = null
}

variable "run_after_block" {
  description = "Specifies the place of the HTTP Action in the Logic App Workflow."
  type        = object({
    action_name   = string
    action_result = string
  })
  default = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    update = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}