resource "aws_route53_zone" "zone" {
  name = "${var.domain}."

  tags = var.common_tags
}
