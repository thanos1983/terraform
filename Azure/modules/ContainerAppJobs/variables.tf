variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "location" {
  description = "The geo-location where the resource lives."
  type        = string
}

variable "parent_id" {
  description = "To deploy to a resource group, use the ID of that resource group."
  type        = string
}

variable "identity_block" {
  description = "An identity block as detailed below."
  type        = object({
    type         = string
    identity_ids = optional(list(string), [])
  })
  default = null
}

variable "environmentId" {
  description = "The ID of the Container App Environment within which this Container App should exist."
  type        = string
  default     = null
}

variable "workloadProfileName" {
  description = "Workload profile name to pin for container app execution."
  type        = string
  default     = null
}

variable "replicaRetryLimit" {
  description = "Maximum number of retries before failing the job."
  type        = number
  default     = 1
}

variable "triggerType" {
  description = "Trigger type of the job."
  type        = string
  validation {
    condition     = contains(["Event", "Manual", "Schedule"], title(var.triggerType))
    error_message = "Possible values are 'Event', 'Manual' or 'Schedule'."
  }
  default = "Schedule"
}

variable "replicaTimeout" {
  description = "Maximum number of seconds a replica is allowed to run."
  type        = number
  default     = 300
}

variable "secrets" {
  description = "Collection of secrets used by a Container Apps Job."
  type        = list(object({
    identity    = optional(string)
    keyVaultUrl = optional(string)
    name        = optional(string)
    value       = optional(string)
  }))
  default = []
}

variable "registries" {
  description = "Collection of private container registry credentials used by a Container apps job."
  type        = list(object({
    identity          = optional(string)
    passwordSecretRef = optional(string)
    server            = optional(string)
    username          = optional(string)
  }))
  default = []
}

variable "scheduleTriggerConfig" {
  description = "Cron formatted repeating trigger schedule (\"* * * * *\") for cronjobs."
  type        = object({
    cronExpression         = string
    parallelism            = number
    replicaCompletionCount = number
  })
  default = null
}

variable "eventTriggerConfig" {
  description = "Trigger configuration of an event driven job."
  type        = object({
    parallelism            = number
    replicaCompletionCount = number
    scale                  = object({
      maxExecutions   = number
      minExecutions   = number
      pollingInterval = number
      rules           = list(object({
        auth = list(object({
          secretRef        = string
          triggerParameter = string
        }))
        metadata = object({
          accountName  = optional(string)
          queueLength  = optional(string)
          queueName    = optional(string)
          namespace    = optional(string)
          messageCount = optional(number)
        })
        name = string
        type = string
      }))
    })
  })
  default = null
}

variable "manualTriggerConfig" {
  description = "Manual trigger configuration for a single execution job."
  type        = object({
    parallelism            = number
    replicaCompletionCount = number
  })
  default = null
}

variable "rules" {
  description = "Scaling rules."
  type        = list(object({
    auth = list(object({
      secretRef        = string
      triggerParameter = string
    }))
    name = string
    type = string
  }))
  default = [
    {
      auth = [
        {
          secretRef        = null
          triggerParameter = null
        }
      ]
      name = null
      type = null
    }
  ]
}

variable "ignore_casing" {
  description = "Whether ignore incorrect casing returned in body to suppress plan-diff."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ignore_casing)))
    error_message = "Possible values are 'true' or 'false'."
  }
  default = false
}

variable "ignore_body_changes" {
  description = "A list of properties that should be ignored when comparing the body with its current state."
  type        = list(string)
  default     = null
}

variable "ignore_missing_property" {
  description = "Whether ignore not returned properties like credentials in body to suppress plan-diff."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ignore_missing_property)))
    error_message = "Possible values are 'true' or 'false'."
  }
  default = true
}

variable "schema_validation_enabled" {
  description = "Whether enabled the validation on type and body with embedded schema."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.schema_validation_enabled)))
    error_message = "Possible values are 'true' or 'false'."
  }
  default = true
}

variable "containers" {
  description = "List of container definitions for the Container App."
  type        = list(object({
    args    = optional(list(string))
    command = optional(list(string))
    env     = optional(list(object({
      name      = string
      secretRef = optional(string)
      value     = optional(string)
    })))
    image  = string
    name   = string
    probes = optional(list(object({
      failureThreshold = number
      httpGet          = optional(object({
        host        = string
        httpHeaders = optional(list(object({
          name  = string
          value = string
        })))
        path   = string
        port   = number
        scheme = string
      }))
      initialDelaySeconds = number
      periodSeconds       = number
      successThreshold    = number
      tcpSocket           = optional(object({
        host = string
        port = number
      }))
      terminationGracePeriodSeconds = number
      timeoutSeconds                = number
      type                          = string
    })))
    resources = object({
      cpu    = number
      memory = string
    })
  }))
  default = null
}

variable "initContainers" {
  description = "List of specialized containers that run before app containers."
  type        = list(object({
    args    = list(string)
    command = list(string)
    env     = list(object({
      name      = string
      secretRef = string
      value     = string
    }))
    image     = string
    name      = string
    resources = object({
      cpu    = number
      memory = string
    })
    volumeMounts = list(object({
      mountPath  = string
      volumeName = string
    }))
  }))
  default = null
}

variable "volumes" {
  description = "List of volume definitions for the Container App."
  type        = list(object({
    name    = string
    secrets = optional(list(object({
      path      = string
      secretRef = string
    })))
    storageName = string
    storageType = string
  }))
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}