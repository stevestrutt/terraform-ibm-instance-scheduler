variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "inventories" {
  description = "User environment details with IP list"
  type = map(object({
    instance_ip_list = list(string)
  }))
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
}