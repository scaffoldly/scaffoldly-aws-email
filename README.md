[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-email)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Set up the provided stages with SES email

## Usage

```hcl
module "email" {
  source = "scaffooldly/aws/email"

  root_email    = var.root_email
  stage_domains = module.dns.stage_domains

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.dns
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.57.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_stage"></a> [stage](#module\_stage) | scaffoldly/stage-email/aws | 1.0.3 |

## Resources

| Name | Type |
|------|------|
| [aws_ses_active_receipt_rule_set.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_active_receipt_rule_set) | resource |
| [aws_ses_receipt_rule_set.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_receipt_rule_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The AWS account ID | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to use | `string` | `"us-east-1"` | no |
| <a name="input_root_email"></a> [root\_email](#input\_root\_email) | The AWS account's email address | `string` | n/a | yes |
| <a name="input_stages"></a> [stages](#input\_stages) | Output var.stages from terraform-aws-bootstrap | <pre>map(<br>    object({<br>      domain           = string<br>      subdomain_suffix = optional(string)<br>      env_vars         = optional(map(string))<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | The subdomain for email sending | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
