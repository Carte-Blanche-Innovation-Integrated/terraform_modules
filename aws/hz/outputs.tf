output "zone_id" {
  value       = aws_route53_zone.zone.zone_id
  description = "The Hosted Zone ID. This can be referenced by zone records."
}
