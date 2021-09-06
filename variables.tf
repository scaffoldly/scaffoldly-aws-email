variable "root_email" {
  type        = string
  description = "The AWS account's email address"
}

variable "subdomain" {
  type        = string
  description = "The subdomain for email sending"
}

variable "stages" {
  type = map(
    object({
      domain           = string
      subdomain_suffix = optional(string)
      env_vars         = optional(map(string))
    })
  )

  description = "Output var.stages from terraform-aws-bootstrap"
}

