variable "name" {
  description = "Name of the SSH Key."
  type        = string
}

variable "public_key" {
  description = "Public key of the SSH Key pair."
  type        = string
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type = map(any)
  default     = null
}
