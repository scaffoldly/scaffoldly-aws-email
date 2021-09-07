variable "aws_region" {
  type        = string
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "account_id" {
  type        = string
  description = "The AWS account ID"
}

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
      stage_domain     = string
      subdomain_suffix = string
      zone_id          = string
    })
  )

  description = "Output api_gateway_stages from terraform-aws-bootstrap"
}

