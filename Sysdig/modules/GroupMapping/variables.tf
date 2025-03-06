variable "group_name" {
  description = "The group name to be mapped."
  type        = string
}

variable "role" {
  description = "The role that is assigned to the users."
  type        = string
}

variable "system_role" {
  description = "The privileges for the user. It can be either 'ROLE_USER' or 'ROLE_CUSTOMER'."
  type        = string
  validation {
    condition = contains(["ROLE_USER", "ROLE_CUSTOMER"], upper(var.system_role))
    error_message = "Possible values can be \"ROLE_USER\" or \"ROLE_CUSTOMER\" boolean."
  }
  default = "ROLE_USER"
}

variable "team_map_block" {
  description = "Block to define team mapping."
  type = object({
    all_teams = optional(bool)
    team_ids = optional(list(string))
  })
}

variable "weight" {
  description = "The group mapping weight used to solve conflicts."
  type        = number
  default     = null
}
