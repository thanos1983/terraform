variable "acl" {
  description = "Bucket's Access Control List."
  type        = string
  default     = "private"
}

variable "bucket" {
  description = "Name of the bucket."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Prefix of the bucket."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = " Force destroy the bucket."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.force_destroy)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "object_locking" {
  description = "Enable object locking for the bucket."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.object_locking)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "quota" {
  description = "Quota of the bucket."
  type        = number
  default     = null # 1073741824 # 1 GB in bytes (1024 * 1024 * 1024 bytes)
}
