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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_stage"></a> [stage](#module\_stage) | scaffoldly/stage-email/aws | 0.15.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ses_active_receipt_rule_set.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_active_receipt_rule_set) | resource |
| [aws_ses_receipt_rule_set.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_receipt_rule_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_root_email"></a> [root\_email](#input\_root\_email) | The AWS account's email address | `string` | n/a | yes |
| <a name="input_stage_domains"></a> [stage\_domains](#input\_stage\_domains) | The stage domain config (the output from the terraform-aws-dns module) | <pre>map(<br>    object({<br>      domain                = string<br>      subdomain             = string<br>      subdomain_suffix      = string<br>      serverless_api_domain = string<br>      platform_domains      = map(string)<br>      certificate_arn       = string<br>      dns_provider          = string<br>      dns_domain_id         = string<br>      stage_env_vars        = map(string)<br>    })<br>  )</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
