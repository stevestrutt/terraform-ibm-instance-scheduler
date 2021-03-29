variable "iam_serviceid_name" {
  description = "scheduler name of the scheduler service id"
  type        = string
  default = ""
}

variable "iam_access_policy" {
  description = "Provide access to services"
  type = map(object({
      roles = list(string)
      }
    )
  )
}

variable "resource_group_id" {
  description = "Resource group id"
  type        = string
  default = ""
}

variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
  default = ""
  sensitive = true
}