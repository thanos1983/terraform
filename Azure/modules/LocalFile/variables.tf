variable "filename" {
  description = "The path to the file that will be created. Missing parent directories will be created."
  type        = string
}

variable "content" {
  description = "Content to store in the file, expected to be a UTF-8 encoded string."
  type        = string
  default     = null
}

variable "content_base64" {
  description = "Content to store in the file, expected to be binary encoded as base64 string."
  type        = string
  default     = null
}

variable "directory_permission" {
  description = "Permissions to set for directories created (before umask), expressed as string in numeric notation."
  type        = string
  default     = "0777"
}

variable "file_permission" {
  description = "Permissions to set for the output file (before umask), expressed as string in numeric notation."
  type        = string
  default     = "0777"
}

variable "file_source" {
  description = "Path to file to use as source for the one we are creating."
  type        = string
  default     = null
}