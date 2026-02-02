variable "message_block" {
  description = "A message block as documented below, which configures the message being sent to the invited user."
  type = object({
    additional_recipients = optional(list(string))
    body                  = optional(string)
    language              = optional(string)
  })
  default = null
}

variable "redirect_url" {
  description = "The URL that the user should be redirected to once the invitation is redeemed."
  type        = string
}

variable "user_display_name" {
  description = "The display name of the user being invited."
  type        = string
  default     = null
}

variable "user_email_address" {
  description = "The email address of the user being invited."
  type        = string
}

variable "user_type" {
  description = "The user type of the user being invited."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 5)
    read   = optional(number, 5)
    delete = optional(number, 5)
  })
  default = null
}
