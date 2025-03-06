variable "name" {
  description = "The team service account name."
  type        = string
}

variable "role" {
  description = "The role that is assigned to the service account."
  type        = string
}

variable "expiration_date" {
  description = "The service account expiration date."
  type        = string
}

variable "team_id" {
  description = "The team where the service account belongs to."
  type        = string
}

variable "system_role" {
  description = "The service account system role."
  type        = string
  default     = "ROLE_SERVICE_ACCOUNT"
}
