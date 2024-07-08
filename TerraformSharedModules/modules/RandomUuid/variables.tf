variable "keepers" {
  description = "Arbitrary map of values that, when changed, will trigger recreation of resource."
  type        = map(string)
  default     = null
}