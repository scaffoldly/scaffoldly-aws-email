resource "aws_ses_receipt_rule_set" "primary" {
  rule_set_name = "primary-rules"
}

resource "aws_ses_active_receipt_rule_set" "primary" {
  rule_set_name = aws_ses_receipt_rule_set.primary.rule_set_name
}

module "stage" {
  for_each = var.stages

  source  = "scaffoldly/stage-email/aws"
  version = "1.0.4"

  stage            = each.key
  root_email       = var.root_email
  zone_id          = each.value.zone_id
  domain           = each.value.stage_domain
  subdomain        = var.subdomain
  subdomain_suffix = each.value.subdomain_suffix
  rule_set_name    = aws_ses_receipt_rule_set.primary.rule_set_name

  providers = {
    aws.dns = aws.dns
  }
}
