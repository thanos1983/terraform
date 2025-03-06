variable "no_mapping_strategy" {
  description = "Sets how the system behaves when no group mapping information received from the IdP or Group information received, but the user is not a member of any mapped group."
  type        = string
}

variable "different_team_same_role_strategy" {
  description = "Sets how the system behaves when conflicting group mapping information received."
  type        = string
}
