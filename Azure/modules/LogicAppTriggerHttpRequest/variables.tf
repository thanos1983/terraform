variable "name" {
  description = "Specifies the name of the Logic App Changing this forces a new resource to be created. "
  type        = string
}

variable "logic_app_id" {
  description = "Specifies the ID of the Logic App Workflow."
  type        = string
}

variable "schema" {
  description = "A JSON Blob defining the Schema of the incoming request."
  type        = string
}

variable "method" {
  description = "Specifies the HTTP Method which the request be using."
  type        = string
  default     = null
}

variable "relative_path" {
  description = "Specifies the Relative Path used for this Request."
  type        = string
  default     = null
}
