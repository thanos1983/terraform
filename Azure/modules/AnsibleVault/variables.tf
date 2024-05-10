variable "vault_file" {
  description = "Path to encrypted vault file."
  type        = string
}

variable "vault_password_file" {
  description = "Path to vault password file."
  type        = string
}

variable "vault_id" {
  description = "ID of the encrypted vault file."
  type        = string
  default     = null
}