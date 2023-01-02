resource "aws_acm_certificate" "cert" {
  domain_name       = var.record_fqdn
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = var.common_tags
}

module "record" {
  source = "../hz-record"

  zone_id = var.zone_id
  records = [
    {
      "name" : tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name,
      "type" : tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type,
      "ttl" : 60,
      "value" : [
        tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value
      ]
    }
  ]
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = module.record.record_fqdns
}
