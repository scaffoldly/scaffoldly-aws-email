resource "aws_ses_receipt_rule_set" "primary" {
  rule_set_name = "primary-rules"
}

resource "aws_ses_active_receipt_rule_set" "primary" {
  rule_set_name = aws_ses_receipt_rule_set.primary.rule_set_name
}

module "stage" {
  for_each = var.stage_domains

  source  = "scaffoldly/stage-email/aws"
  version = "0.15.4"

  stage         = each.key
  root_email    = var.root_email
  mail_domain   = each.value.platform_domains.mail_domain
  dns_provider  = lookup(each.value, "dns_provider", "unknown-dns-provider")
  dns_domain_id = lookup(each.value, "dns_domain_id", "unknown-dns-domain-id")
  rule_set_name = aws_ses_receipt_rule_set.primary.rule_set_name

  providers = {
    aws.dns = aws.dns
  }
}
