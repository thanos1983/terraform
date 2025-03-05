variable "name" {
  description = "The name of the Secure policy. It must be unique."
  type        = string
}

variable "comment" {
  description = "The description of Secure scanning policy."
  type        = string
}

variable "rules_blocks" {
  description = "Define all rules included in the Policy for scanning detection."
  type = list(object({
    gate    = string
    trigger = string
    params_blocks = list(object({
      name  = string
      value = string
    }))
    action = string
  }))
  default = []
}
