variable "always_run" {
  description = "When to trigger the MS SQL Table Database Creation."
  type        = string
}

variable "command" {
  description = "Command to execute"
  type        = string
}

#variable "azurerm_sql_server_name" {
#  description = "SQL Server name to connect."
#  type        = string
#}
#
#variable "azurerm_sql_database_name" {
#  description = "SQL Database name on the server to connect."
#  type        = string
#}
#
#variable "administrator_login" {
#  description = "SQL Username for the Server."
#  type        = string
#}
#
#variable "administrator_login_password" {
#  description = "SQL Password for the Server."
#  type        = string
#}
#
#variable "sql_cmd_input_files" {
#  description = "Gets or sets the path to a file that contains a batch of SQL statements."
#  type        = string
#}

variable "working_dir" {
  description = "If provided, specifies the working directory where command will be executed."
  type        = string
  default     = null
}

variable "interpreter" {
  description = "If provided, this is a list of interpreter arguments used to execute the command."
  type        = list(string)
  default     = null
}

variable "environment" {
  description = "Block of key value pairs representing the environment of the executed command."
  type        = map(any)
  default     = null
}

variable "quiet" {
  description = "If set to true, Terraform will not print the command to be executed to stdout, and will instead print 'Suppressed by quiet=true'."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.quiet)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}