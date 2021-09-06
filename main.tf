resource "aws_ses_receipt_rule_set" "primary" {
  rule_set_name = "primary-rules"
}

resource "aws_ses_active_receipt_rule_set" "primary" {
  rule_set_name = aws_ses_receipt_rule_set.primary.rule_set_name
}

module "stage" {
  for_each = var.stages

  source  = "scaffoldly/stage-email/aws"
  version = "1.0.1"

  stage            = each.key
  root_email       = var.root_email
  domain           = each.value.domain
  subdomain        = var.subdomain
  subdomain_suffix = each.value.subdomain_suffix != null ? each.value.subdomain_suffix : ""
  rule_set_name    = aws_ses_receipt_rule_set.primary.rule_set_name

  providers = {
    aws.dns = aws.root
  }
}
