variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = "default"
}

variable "inventories" {
  description = "User environment details with IP list"
  type = map(object({
    instance_ip_list = list(string)
  }))
  default = {
    dev = {
        instance_ip_list = [
            "10.240.64.4"
        ]
    }
  }
}

variable "schedules" {
  description = "VM groups schedules with action"
  type = map(object({
      cron = string
      action = string
      env = string
      enabled = bool
      }
    )
  )
  default = {

    dev_7am_start_everyday = {
        cron = "0 7 * * *"
        action = "start"
        env = "dev"
        enabled = true
    }

    dev_11pm_stop_everyday = {
        cron = "0 23 * * *"
        action = "stop"
        env = "dev"
        enabled = true
    }
  }
}