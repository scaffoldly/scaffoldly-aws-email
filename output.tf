output "mail_stages" {
  value = {
    for stage in module.stage :
    stage.stage => {
      mail_domain     = stage.domain
      noreply_address = stage.noreply_address
    }
  }
  description = "A map of Mail stages, keyed by stage"
}
